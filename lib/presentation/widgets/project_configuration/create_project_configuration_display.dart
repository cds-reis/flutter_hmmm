import 'package:animate_gradient/animate_gradient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../domain/entities/project_configuration.dart';
import '../../hooks/use_text_editing_controller_with_state.dart';
import '../utils/path_text_field.dart';
import 'save_project_configuration_button.dart';

class CreateProjectConfigurationDisplay extends HookWidget {
  const CreateProjectConfigurationDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    final gamePath = useTextEditingControllerWithState(
      transformer: GamePath.parse,
    );

    final additionalModsPath = useTextEditingControllerWithState(
      transformer: AdditionalModsPath.parse,
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          width: constraints.maxWidth * .75,
          child: AnimateGradient(
            primaryColors: const [Colors.pinkAccent, Colors.purpleAccent],
            secondaryColors: const [Colors.greenAccent, Colors.blue],
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
                    helperText:
                        r'The folder you place the .patchwad files (C:\Users\$YourUser\Documents\My Games\HotlineMiami2\mods)',
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SaveProjectConfigurationButton(
                      gamePath: gamePath,
                      additionalModsPath: additionalModsPath,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
