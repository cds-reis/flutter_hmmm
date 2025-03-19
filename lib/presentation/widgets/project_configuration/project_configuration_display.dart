import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/entities/default_hotline_miami_music.dart';
import '../../../domain/entities/project_configuration.dart';
import '../../providers/default_music_provider.dart';
import '../../providers/project_configuration_provider.dart';
import '../default_music/default_music_error_display.dart';
import '../default_music/default_music_file_picker.dart';
import '../hotline_miami_mods/hotline_miami_mods_display.dart';
import 'create_project_configuration_display.dart';
import 'project_configuration_error_display.dart';

class ProjectConfigurationDisplay extends ConsumerWidget {
  const ProjectConfigurationDisplay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectConfiguration = ref.watch(
      projectConfigurationNotifierProvider,
    );

    final defaultMusic = ref.watch(defaultMusicProvider);

    return switch ((projectConfiguration, defaultMusic)) {
      (AsyncData(value: null), _) => const CreateProjectConfigurationDisplay(),
      (_, AsyncData(value: null)) => const DefaultMusicFilePicker(),
      (
        AsyncData(value: ProjectConfiguration()),
        AsyncData(value: DefaultHotlineMiamiMusic()),
      ) =>
        const HotlineMiamiModsDisplay(),
      (AsyncError(:final error, :final stackTrace), _) =>
        ProjectConfigurationErrorDisplay(error: error, stackTrace: stackTrace),
      (_, AsyncError(:final error, :final stackTrace)) =>
        DefaultMusicErrorDisplay(error: error, stackTrace: stackTrace),
      (AsyncLoading(), _) ||
      (_, AsyncLoading()) => const CircularProgressIndicator(),
      _ => throw UnimplementedError(),
    };
  }
}
