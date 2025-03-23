// ignore_for_file: require_trailing_commas //

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../project_configuration/gradient_enabled_button.dart';

typedef GradientStep = ({Color begin, Color end});

class CustomAnimatedGradient extends StatefulWidget {
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
  State<CustomAnimatedGradient> createState() => _CustomAnimatedGradientState();
}

class _CustomAnimatedGradientState extends State<CustomAnimatedGradient>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _firstColorAnimation;
  late Animation<Color?> _secondColorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: widget.duration, vsync: this);

    _setupAnimations();
  }

  void _setupAnimations() {
    final firstColors = <TweenSequenceItem<Color?>>[];
    final secondColors = <TweenSequenceItem<Color?>>[];

    for (var i = 1; i < widget.gradientSteps.length; i++) {
      final step = widget.gradientSteps[i - 1];
      final nextStep = widget.gradientSteps[i];

      firstColors.add(
        TweenSequenceItem(
          tween: ColorTween(begin: step.begin, end: nextStep.begin),
          weight: 1,
        ),
      );
      secondColors.add(
        TweenSequenceItem(
          tween: ColorTween(begin: step.end, end: nextStep.end),
          weight: 1,
        ),
      );
    }

    _firstColorAnimation = TweenSequence<Color?>(
      firstColors,
    ).animate(CurvedAnimation(parent: _controller, curve: widget.curve));
    _secondColorAnimation = TweenSequence<Color?>(
      secondColors,
    ).animate(CurvedAnimation(parent: _controller, curve: widget.curve));
  }

  @override
  void didUpdateWidget(CustomAnimatedGradient oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.gradientSteps != widget.gradientSteps ||
        oldWidget.duration != widget.duration ||
        oldWidget.curve != widget.curve) {
      _setupAnimations();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final enabled = ref.watch(gradientAnimationProvider);

        if (enabled && !_controller.isAnimating) {
          _controller.repeat(reverse: widget.reverse);
        } else if (!enabled && _controller.isAnimating) {
          _controller.stop();
        }

        if (!enabled) {
          return DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: widget.begin,
                end: widget.end,
                colors: [
                  widget.gradientSteps.first.begin,
                  widget.gradientSteps.first.end,
                ],
              ),
            ),
            child: widget.child,
          );
        }

        return AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: widget.begin,
                  end: widget.end,
                  colors: [
                    _firstColorAnimation.value ?? Colors.transparent,
                    _secondColorAnimation.value ?? Colors.transparent,
                  ],
                ),
              ),
              child: child,
            );
          },
          child: widget.child,
        );
      },
    );
  }
}
