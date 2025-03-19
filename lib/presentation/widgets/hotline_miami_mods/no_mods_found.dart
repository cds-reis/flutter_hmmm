import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'hotline_miami_mods_display.dart';

class NoModsFound extends ConsumerWidget {
  const NoModsFound({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox.expand(
      child: Column(
        spacing: 16,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'No mods were found.',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Text(
            'If you do have mods installed, please see the logs for more information.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          TextButton.icon(
            onPressed: () {
              ref.invalidate(hotlineMiamiModsProvider);
            },
            label: const Text('Refresh'),
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}
