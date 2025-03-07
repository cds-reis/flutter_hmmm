import 'package:animate_gradient/animate_gradient.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

void showInvalidPathsDialog(BuildContext context, List<String> invalidPaths) {
  showDialog<void>(
    context: context,
    builder:
        (context) => AlertDialog(
          contentPadding: const EdgeInsets.all(8),
          content: AnimateGradient(
            primaryColors: const [
              Colors.lightGreen,
              Colors.greenAccent,
              Colors.indigoAccent,
            ],
            secondaryColors: const [
              Colors.purple,
              Colors.deepPurple,
              Colors.cyan,
            ],
            duration: const Duration(seconds: 3, milliseconds: 500),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: ColoredBox(
                color: Theme.of(context).colorScheme.surfaceContainerLow,
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Invalid Paths',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const Gap(16),
                      for (final path in invalidPaths)
                        Text(
                          'The $path is invalid. Please check the path and try again.',
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
  );
}
