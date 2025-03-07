import '../entities/project_configuration.dart';

abstract interface class ProjectConfigurationRepository {
  Future<ProjectConfiguration?> getProjectConfiguration();

  Future<void> saveProjectConfiguration(
    ProjectConfiguration projectConfiguration,
  );
}
