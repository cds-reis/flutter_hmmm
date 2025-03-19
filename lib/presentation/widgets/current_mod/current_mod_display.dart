import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/entities/hotline_miami_mod.dart';
import '../../providers/current_mod_provider.dart';
import '../utils/animations/text_loading.dart';

class CurrentModDisplay extends ConsumerWidget {
  const CurrentModDisplay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentMod = ref.watch(currentModProvider);

    final textStyle = Theme.of(context).textTheme.titleLarge;

    return switch (currentMod) {
      AsyncLoading() => TextLoading(textStyle: textStyle),
      AsyncData(value: null) => Text(
        'No current mod being used',
        style: textStyle,
      ),
      AsyncData(value: final HotlineMiamiMod mod) => Column(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Current mod: ${mod.name}', style: textStyle),
          TextButton(
            onPressed: () {
              ref.read(currentModProvider.notifier).useDefault();
            },
            child: const Text('Clear current mod'),
          ),
        ],
      ),
      AsyncError() => Text(
        'An error happened trying to get the current mod. Please see the logs',
        style: textStyle,
      ),
      _ => throw UnimplementedError(),
    };
  }
}
