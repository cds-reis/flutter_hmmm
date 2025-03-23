import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../providers/global_providers.dart';
import '../../utils/dialogs/default_dialog.dart';

part 'run_game_button.g.dart';

const _steamUrl = 'steam://rungameid/274170';

@riverpod
Future<ProcessResult> runGame(Ref ref) {
  return Process.run('cmd', ['/C', 'start', '', _steamUrl]);
}

class RunGameButton extends HookConsumerWidget {
  const RunGameButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loading = useState(false);

    return TextButton.icon(
      onPressed: loading.value ? null : () => _onPressed(context, ref, loading),
      label: const Text('Run Game'),
      icon: Icon(loading.value ? Icons.hourglass_empty : Icons.play_arrow),
    );
  }

  Future<void> _onPressed(
    BuildContext context,
    WidgetRef ref,
    ValueNotifier<bool> loading,
  ) async {
    loading.value = false;
    try {
      final result = await ref.read(runGameProvider.future);
      if (!context.mounted) {
        return;
      }

      if (result.exitCode != 0) {
        showDialog<void>(
          context: context,
          builder: (context) {
            return DefaultDialog(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                spacing: 16,
                children: [
                  Text('Error', style: Theme.of(context).textTheme.titleLarge),
                  Text(
                    'Failed to launch the game. See logs for more details.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    result.stderr.toString(),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            );
          },
        ).ignore();

        ref
            .read(talkerProvider)
            .error(
              'Failed to launch the game. Code: ${result.exitCode}.',
              result.stderr,
            );
      }
    } on Exception catch (e, st) {
      ref.read(talkerProvider).error('Failed to launch the game.', e, st);
    } finally {
      loading.value = false;
    }
  }
}
