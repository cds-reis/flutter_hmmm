import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/project_configuration.dart';
import 'repositories_providers.dart';

part 'project_configuration_provider.g.dart';

@riverpod
class ProjectConfigurationNotifier extends _$ProjectConfigurationNotifier {
  @override
  Future<ProjectConfiguration?> build() {
    final repository = ref.watch(projectConfigurationRepositoryProvider);

    return repository.getProjectConfiguration();
  }

  Future<void> saveProjectConfiguration(ProjectConfiguration configuration) {
    final repository = ref.read(projectConfigurationRepositoryProvider);

    state = AsyncData(configuration);

    return repository.saveProjectConfiguration(configuration);
  }
}
