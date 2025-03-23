import 'package:flutter/material.dart';

class SwayingWidget extends StatefulWidget {
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
  State<SwayingWidget> createState() => _SwayingWidgetState();
}

class _SwayingWidgetState extends State<SwayingWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: widget.duration, vsync: this);
    _animation = Tween<double>(
      begin: -widget.angle - widget.angle,
      end: -widget.angle,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.rotate(angle: _animation.value, child: child);
      },
      child: widget.child,
    );
  }
}
