import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/entities/project_configuration.dart';
import '../../hooks/use_text_editing_controller_with_state.dart';
import '../../providers/project_configuration_provider.dart';
import '../utils/animations/custom_animated_gradient.dart';
import '../utils/path_text_field.dart';
import 'save_project_configuration_button.dart';

class EditProjectConfigurationDisplay extends HookConsumerWidget {
  const EditProjectConfigurationDisplay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentProjectConfiguration =
        ref.watch(projectConfigurationNotifierProvider).requireValue!;

    final gamePath = useTextEditingControllerWithState(
      transformer: GamePath.parse,
      initialText: currentProjectConfiguration.gamePath.path,
    );

    final additionalModsPath = useTextEditingControllerWithState(
      transformer: AdditionalModsPath.parse,
      initialText: currentProjectConfiguration.additionalModsPath.path,
    );

    return SizedBox(
      width: MediaQuery.sizeOf(context).width * .75,
      child: CustomAnimatedGradient(
        gradientSteps: const [
          (begin: Colors.pinkAccent, end: Colors.purpleAccent),
          (begin: Colors.greenAccent, end: Colors.blue),
        ],
        duration: const Duration(seconds: 6),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            spacing: 32,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              PathTextField(
                controller: gamePath.controller,
                labelText: 'Game Path',
                helperText:
                    r'The folder where you store your game (D:\SteamLibrary\steamapps\common\Hotline Miami 2)',
              ),
              PathTextField(
                controller: additionalModsPath.controller,
                labelText: 'Additional Mods Path',
                helperText: r'''
The folder you place the .patchwad files (C:\Users\$YourUser\Documents\My Games\HotlineMiami2\mods).
The files inside your additional mods folder will not be carried over.
''',
              ),
              Row(
                spacing: 16,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Close'),
                  ),
                  SaveProjectConfigurationButton(
                    gamePath: gamePath,
                    additionalModsPath: additionalModsPath,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
