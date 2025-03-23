import 'package:flutter/material.dart';

import '../../../../domain/entities/hotline_miami_mod.dart';

class ModItemDisplayText extends StatefulWidget {
  const ModItemDisplayText({
    required this.mod,
    required this.active,
    super.key,
  });

  final HotlineMiamiMod mod;
  final bool active;

  @override
  State<ModItemDisplayText> createState() => _ModItemDisplayTextState();
}

class _ModItemDisplayTextState extends State<ModItemDisplayText>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);

    _updateColorAnimation();
  }

  @override
  void didUpdateWidget(covariant ModItemDisplayText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.active != widget.active) {
      _updateColorAnimation();
    }
  }

  void _updateColorAnimation() {
    _colorAnimation = ColorTween(
      begin: widget.active ? Colors.blue.shade300 : Colors.grey.shade600,
      end: widget.active ? Colors.blue.shade600 : Colors.grey.shade700,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _colorAnimation,
      builder: (context, _) {
        return Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              Text(
                widget.mod.name,
                style: TextStyle(color: _colorAnimation.value),
              ),
              Text(
                'by ${widget.mod.author}',
                style: TextStyle(color: _colorAnimation.value),
              ),
            ],
          ),
        );
      },
    );
  }
}
