import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../hooks/use_effect_once.dart';

class SwayingWidget extends HookWidget {
  const SwayingWidget({
    required this.child,
    super.key,
    this.duration = const Duration(seconds: 2),
    this.angle = 0.05,
  });

  final Widget child;
  final Duration duration;

  /// The angle of the sway in radians.
  final double angle;

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(duration: duration);

    useEffectOnce(() {
      controller.repeat(reverse: true);
      return null;
    });

    final animation = useAnimation(
      Tween<double>(
        begin: -angle - angle,
        end: -angle,
      ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut)),
    );

    return Transform.rotate(angle: animation, child: child);
  }
}
