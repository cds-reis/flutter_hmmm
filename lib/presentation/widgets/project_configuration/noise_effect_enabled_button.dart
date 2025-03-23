import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../providers/repositories_providers.dart';

part 'noise_effect_enabled_button.g.dart';

const _noiseEffectEnabledKey = 'noiseEffectEnabled';

@riverpod
class NoiseEffectEnabled extends _$NoiseEffectEnabled {
  @override
  bool build() {
    ref
        .watch(sharedPreferencesProvider)
        .getBool(_noiseEffectEnabledKey)
        .then((value) => state = value ?? true);

    return true;
  }

  void _onPressed() {
    final newState = !state;
    state = newState;
    ref
        .read(sharedPreferencesProvider)
        .setBool(_noiseEffectEnabledKey, newState);
  }
}

class NoiseEffectEnabledButton extends ConsumerWidget {
  const NoiseEffectEnabledButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final enabled = ref.watch(noiseEffectEnabledProvider);

    return ElevatedButton(
      onPressed: () {
        ref.read(noiseEffectEnabledProvider.notifier)._onPressed();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        spacing: 16,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Noise Effect',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  'Enable or disable the noise effect for the project.',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  '(The noise effect can be expensive to compute, so you might want to disable it)',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          IgnorePointer(child: Switch(value: enabled, onChanged: (value) {})),
        ],
      ),
    );
  }
}
