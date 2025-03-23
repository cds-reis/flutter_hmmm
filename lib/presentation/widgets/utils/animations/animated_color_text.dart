import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../hooks/use_effect_once.dart';

class AnimatedColorText extends HookWidget {
  const AnimatedColorText({
    required this.text,
    required this.colors,
    this.duration = const Duration(seconds: 3),
    this.style,
    this.curve = Curves.linear,
    super.key,
  }) : assert(colors.length >= 2, 'Colors must have at least 2 colors');

  final Duration duration;
  final String text;
  final List<Color> colors;
  final TextStyle? style;
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(duration: duration);

    useEffectOnce(() {
      controller.repeat(reverse: true);
      return null;
    });

    final items = <TweenSequenceItem<Color?>>[];

    for (var i = 1; i < colors.length; i++) {
      final color = colors[i - 1];
      final nextColor = colors[i];

      final tween = ColorTween(begin: color, end: nextColor);
      final item = TweenSequenceItem(tween: tween, weight: 1);

      items.add(item);
    }

    final color = useAnimation(
      TweenSequence<Color?>(
        items,
      ).animate(CurvedAnimation(parent: controller, curve: curve)),
    );

    return Text(
      text,
      style: switch (style) {
        null => TextStyle(color: color),
        final TextStyle style => style.copyWith(color: color),
      },
    );
  }
}
