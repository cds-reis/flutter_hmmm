import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/project_configuration.dart';
import '../../domain/repositories/project_configuration_repository.dart';

const _projectConfigurationKey = 'projectConfiguration';

class SharedPrefsProjectConfigurationRepository
    implements ProjectConfigurationRepository {
  const SharedPrefsProjectConfigurationRepository({
    required SharedPreferencesAsync prefs,
  }) : _prefs = prefs;

  final SharedPreferencesAsync _prefs;

  @override
  Future<ProjectConfiguration?> getProjectConfiguration() async {
    final projectConfigurationJson = await _prefs.getString(
      _projectConfigurationKey,
    );

    if (projectConfigurationJson == null) {
      return null;
    }

    return ProjectConfigurationMapper.fromJson(projectConfigurationJson);
  }

  @override
  Future<void> saveProjectConfiguration(
    ProjectConfiguration projectConfiguration,
  ) {
    return _prefs.setString(
      _projectConfigurationKey,
      projectConfiguration.toJson(),
    );
  }
}
