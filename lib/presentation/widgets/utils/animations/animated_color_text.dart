import 'package:flutter/material.dart';

class AnimatedColorText extends StatefulWidget {
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
  State<AnimatedColorText> createState() => _AnimatedColorTextState();
}

class _AnimatedColorTextState extends State<AnimatedColorText>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: widget.duration, vsync: this);
    _setupAnimation();
    _controller.repeat(reverse: true);
  }

  void _setupAnimation() {
    final items = <TweenSequenceItem<Color?>>[];

    for (var i = 1; i < widget.colors.length; i++) {
      final color = widget.colors[i - 1];
      final nextColor = widget.colors[i];

      items.add(
        TweenSequenceItem(
          tween: ColorTween(begin: color, end: nextColor),
          weight: 1,
        ),
      );
    }

    _colorAnimation = TweenSequence<Color?>(
      items,
    ).animate(CurvedAnimation(parent: _controller, curve: widget.curve));
  }

  @override
  void didUpdateWidget(AnimatedColorText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.colors != widget.colors ||
        oldWidget.duration != widget.duration ||
        oldWidget.curve != widget.curve) {
      _setupAnimation();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return Text(
          widget.text,
          style: switch (widget.style) {
            null => TextStyle(color: _colorAnimation.value),
            final TextStyle style => style.copyWith(
              color: _colorAnimation.value,
            ),
          },
        );
      },
    );
  }
}
