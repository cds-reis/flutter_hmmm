import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../hooks/use_effect_once.dart';

class PathTextField extends HookWidget {
  const PathTextField({
    required this.controller,
    required this.labelText,
    this.helperText,
    super.key,
  });

  final TextEditingController controller;
  final String labelText;
  final String? helperText;

  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController(
      duration: const Duration(seconds: 2),
    );

    useEffectOnce(() {
      animationController.repeat(reverse: true);
      return null;
    });

    final color = useAnimation(
      ColorTween(
        begin: Colors.white,
        end: Theme.of(context).inputDecorationTheme.labelStyle?.color,
      ).animate(animationController),
    );

    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        helperText: helperText,
        labelStyle: TextStyle(color: color),
        floatingLabelStyle: TextStyle(color: color),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(8),
          child: IconButton(
            onPressed: _onPressed,
            icon: const Icon(Icons.folder_zip),
          ),
        ),
      ),
    );
  }

  Future<void> _onPressed() async {
    final text = controller.text;
    final result = await getDirectoryPath(
      initialDirectory: text.isEmpty ? null : text,
    );

    if (result == null) return;

    controller.text = result;
  }
}
