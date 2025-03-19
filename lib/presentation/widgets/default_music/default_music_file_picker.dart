import 'package:animate_gradient/animate_gradient.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../providers/default_music_provider.dart';
import '../../providers/project_configuration_provider.dart';

class DefaultMusicFilePicker extends ConsumerWidget {
  const DefaultMusicFilePicker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          width: constraints.maxWidth * .50,
          child: AnimateGradient(
            primaryColors: const [Colors.pinkAccent, Colors.purpleAccent],
            secondaryColors: const [Colors.greenAccent, Colors.blue],
            duration: const Duration(seconds: 6),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                spacing: 16,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Default music',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    'This program needs the default music file to be set. It normally is called "hlm2_music_desktop.wad".',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  TextButton.icon(
                    onPressed: () => _onPressed(ref),
                    label: const Center(
                      child: Text('Select the current default music file'),
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

  Future<void> _onPressed(WidgetRef ref) async {
    final projectConfiguration = await ref.read(
      projectConfigurationNotifierProvider.future,
    );
    if (projectConfiguration == null) {
      return;
    }

    final music = await openFile(
      initialDirectory: projectConfiguration.gamePath.path,
      acceptedTypeGroups: [
        const XTypeGroup(extensions: ['.wad']),
      ],
    );

    if (music == null) {
      return;
    }

    await ref.read(defaultMusicProvider.notifier).set(music);
  }
}
