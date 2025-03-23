import 'package:flutter/material.dart';

import '../animations/custom_animated_gradient.dart';

class DefaultDialog extends StatelessWidget {
  const DefaultDialog({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(8),
      content: CustomAnimatedGradient(
        gradientSteps: const [
          (begin: Colors.lightGreen, end: Colors.purple),
          (begin: Colors.greenAccent, end: Colors.deepPurple),
          (begin: Colors.indigoAccent, end: Colors.cyan),
        ],
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
