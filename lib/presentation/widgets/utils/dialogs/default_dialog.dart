import 'package:animate_gradient/animate_gradient.dart';
import 'package:flutter/material.dart';

class DefaultDialog extends StatelessWidget {
  const DefaultDialog({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(8),
      content: AnimateGradient(
        primaryColors: const [
          Colors.lightGreen,
          Colors.greenAccent,
          Colors.indigoAccent,
        ],
        secondaryColors: const [Colors.purple, Colors.deepPurple, Colors.cyan],
        duration: const Duration(seconds: 3, milliseconds: 500),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ColoredBox(
            color: Theme.of(context).colorScheme.surfaceContainerLow,
            child: Padding(padding: const EdgeInsets.all(24), child: child),
          ),
        ),
      ),
    );
  }
}
