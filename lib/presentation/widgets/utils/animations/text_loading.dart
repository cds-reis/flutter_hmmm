import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../hooks/use_effect_once.dart';

class TextLoading extends HookWidget {
  const TextLoading({super.key, this.textStyle});

  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(
      duration: const Duration(seconds: 1),
    );

    useEffectOnce(() {
      controller.repeat();
      return null;
    });

    final dotsAmount = useAnimation(
      IntTween(begin: 1, end: 3).animate(controller),
    );

    return Text('.' * dotsAmount, style: textStyle);
  }
}
