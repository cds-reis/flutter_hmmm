import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../hooks/use_effect_once.dart';

class AnimatedColorText extends HookWidget {
  const AnimatedColorText({
    required this.duration,
    required this.text,
    required this.colors,
    super.key,
  }) : assert(colors.length >= 2, 'Colors must have at least 2 colors');

  final Duration duration;
  final String text;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(duration: duration);

    useEffectOnce(() {
      controller.repeat();
      return null;
    });

    final items = <TweenSequenceItem<Color?>>[];

    for (var i = 0; i < colors.length; i++) {
      final color = colors[i];
      final nextColor = colors[(i + 1) % colors.length];

      final tween = ColorTween(begin: color, end: nextColor);
      final item = TweenSequenceItem(tween: tween, weight: 1);

      items.add(item);
    }

    final color = useAnimation(
      TweenSequence<Color?>(items).animate(controller),
    );

    return Text(text, style: TextStyle(color: color));
  }
}
