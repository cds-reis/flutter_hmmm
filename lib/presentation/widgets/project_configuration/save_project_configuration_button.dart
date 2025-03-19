import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/entities/project_configuration.dart';
import '../../../domain/use_cases/parse_existing_directory.dart';
import '../../providers/global_providers.dart';
import '../../providers/project_configuration_provider.dart';
import '../utils/dialogs/show_invalid_paths_dialog.dart';

class SaveProjectConfigurationButton extends ConsumerWidget {
  const SaveProjectConfigurationButton({
    required this.gamePath,
    required this.additionalModsPath,
    super.key,
  });

  final ({
    TextEditingController controller,
    Either<DirectoryDoesNotExistException, GamePath> state,
  })
  gamePath;

  final ({
    TextEditingController controller,
    Either<DirectoryDoesNotExistException, AdditionalModsPath> state,
  })
  additionalModsPath;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
      onPressed: () => onPressed(context, ref),
      child: const Text('Save'),
    );
  }

  void onPressed(BuildContext context, WidgetRef ref) {
    final (invalidPaths, validPaths) = [
      ('Game Path', gamePath),
      ('Additional Mods Path', additionalModsPath),
    ].partition((path) => path.$2.state.isRight());

    if (invalidPaths.isNotEmpty) {
      showInvalidPathsDialog(context, invalidPaths.map((e) => e.$1).toList());
      return;
    }

    final [validGamePath, validAdditionalModsPath] =
        validPaths.map((e) => e.$2.state).rightsEither();

    final projectConfiguration = ProjectConfiguration(
      gamePath: GamePath(validGamePath),
      additionalModsPath: AdditionalModsPath(validAdditionalModsPath),
    );

    ref.read(talkerProvider).info('Saving project configuration');
    ref
        .read(talkerProvider)
        .verbose('Project configuration: $projectConfiguration');

    ref
        .read(projectConfigurationNotifierProvider.notifier)
        .saveProjectConfiguration(projectConfiguration);
  }
}
