import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/entities/project_configuration.dart';
import '../../providers/project_configuration_provider.dart';
import 'create_project_configuration_display.dart';

class ProjectConfigurationDisplay extends ConsumerWidget {
  const ProjectConfigurationDisplay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectConfiguration = ref.watch(
      projectConfigurationNotifierProvider,
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 16,
      children: [
        const Text('Project Configuration'),
        switch (projectConfiguration) {
          AsyncData(value: final ProjectConfiguration projectConfiguration) =>
            Column(
              children: [
                Text('Game Path: ${projectConfiguration.gamePath}'),
                Text(
                  'Additional Mods Path: ${projectConfiguration.additionalModsPath}',
                ),
                Text(
                  'Custom Mods Folder: ${projectConfiguration.customModsFolder}',
                ),
              ],
            ),
          AsyncData(value: null) => const CreateProjectConfigurationDisplay(),
          AsyncError(:final error) => Text(error.toString()),
          AsyncLoading() => const CircularProgressIndicator(),
          _ => throw UnimplementedError(),
        },
      ],
    );
  }
}
