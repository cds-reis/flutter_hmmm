import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../../providers/global_providers.dart';
import '../project_configuration/edit_project_configuration_display.dart';
import '../project_configuration/gradient_enabled_button.dart';
import '../project_configuration/noise_effect_enabled_button.dart';
import '../utils/dialogs/default_dialog.dart';

class ConfigurationDialog extends StatelessWidget {
  const ConfigurationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultDialog(
      child: Column(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Configuration', style: Theme.of(context).textTheme.titleLarge),
          ElevatedButton(
            onPressed: () {
              showDialog<void>(
                context: context,
                builder: (context) {
                  return const DefaultDialog(
                    child: EditProjectConfigurationDisplay(),
                  );
                },
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Project Folder Paths',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  'Change the path of the folders containing the game and the mods.',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (context) {
                    return Theme(
                      data: ThemeData(),
                      child: Consumer(
                        builder: (_, ref, _) {
                          return TalkerScreen(talker: ref.read(talkerProvider));
                        },
                      ),
                    );
                  },
                ),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Application Logs',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  'View the logs of the application.',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  "(Helpful for debugging, you probably don't need to use this)",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          const NoiseEffectEnabledButton(),
          const GradientAnimationEnabledButton(),
        ],
      ),
    );
  }
}
