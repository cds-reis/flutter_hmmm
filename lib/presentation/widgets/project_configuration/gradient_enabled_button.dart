import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../providers/repositories_providers.dart';

part 'gradient_enabled_button.g.dart';

const _gradientEnabledKey = 'gradientEnabled';

@riverpod
class GradientAnimation extends _$GradientAnimation {
  @override
  bool build() {
    ref
        .watch(sharedPreferencesProvider)
        .getBool(_gradientEnabledKey)
        .then((value) => state = value ?? true);

    return true;
  }

  void _onPressed() {
    final newState = !state;
    ref.read(sharedPreferencesProvider).setBool(_gradientEnabledKey, newState);
    state = newState;
  }
}

class GradientAnimationEnabledButton extends ConsumerWidget {
  const GradientAnimationEnabledButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final enabled = ref.watch(gradientAnimationProvider);

    return ElevatedButton(
      onPressed: () {
        ref.read(gradientAnimationProvider.notifier)._onPressed();
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
                  'Gradient Animation',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  'Enable or disable the gradient animation for the project.',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  '(The gradient animation can be expensive to compute, so you might want to disable it)',
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
