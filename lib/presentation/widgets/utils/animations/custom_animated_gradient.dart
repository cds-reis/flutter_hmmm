// ignore_for_file: require_trailing_commas //

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../project_configuration/gradient_enabled_button.dart';

typedef GradientStep = ({Color begin, Color end});

class CustomAnimatedGradient extends HookConsumerWidget {
  const CustomAnimatedGradient({
    required this.gradientSteps,
    required this.child,
    this.duration = const Duration(seconds: 3),
    this.curve = Curves.linear,
    this.reverse = true,
    this.begin = Alignment.topCenter,
    this.end = Alignment.bottomCenter,
    super.key,
  }) : assert(
         gradientSteps.length > 1,
         'gradientSteps must have at least 2 steps',
       );

  final List<GradientStep> gradientSteps;
  final Duration duration;
  final Widget child;
  final Curve curve;
  final bool reverse;
  final Alignment begin;
  final Alignment end;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animationController = useAnimationController(duration: duration);
    final enabled = ref.watch(gradientAnimationProvider);

    useEffect(() {
      if (enabled) {
        animationController.repeat(reverse: reverse);
      } else {
        animationController.stop();
      }

      return animationController.stop;
    }, [enabled]);

    if (!enabled) {
      return DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: begin,
            end: end,
            colors: [gradientSteps.first.begin, gradientSteps.first.end],
          ),
        ),
        child: child,
      );
    }

    final firstColors = <TweenSequenceItem<Color?>>[];
    final secondColors = <TweenSequenceItem<Color?>>[];

    for (var i = 1; i < gradientSteps.length; i++) {
      final step = gradientSteps[i - 1];
      final nextStep = gradientSteps[i];

      final firstTween = ColorTween(begin: step.begin, end: nextStep.begin);
      final secondTween = ColorTween(begin: step.end, end: nextStep.end);

      final firstItem = TweenSequenceItem(tween: firstTween, weight: 1);
      final secondItem = TweenSequenceItem(tween: secondTween, weight: 1);

      firstColors.add(firstItem);
      secondColors.add(secondItem);
    }

    final firstColor = useAnimation(
      TweenSequence<Color?>(
        firstColors,
      ).animate(CurvedAnimation(parent: animationController, curve: curve)),
    );

    final secondColor = useAnimation(
      TweenSequence<Color?>(
        secondColors,
      ).animate(CurvedAnimation(parent: animationController, curve: curve)),
    );

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: begin,
          end: end,
          colors: [
            firstColor ?? Colors.transparent,
            secondColor ?? Colors.transparent,
          ],
        ),
      ),
      child: child,
    );
  }
}
