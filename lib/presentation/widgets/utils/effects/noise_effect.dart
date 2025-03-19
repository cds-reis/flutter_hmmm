import 'dart:math';

import 'package:flutter/material.dart';

class NoiseEffect extends StatefulWidget {
  const NoiseEffect({
    required this.child,
    super.key,
    this.color = Colors.white,
    this.density = 0.0025,
    this.opacity = 0.2,
  });

  final Widget child;
  final Color color;
  final double density;
  final double opacity;

  @override
  State<NoiseEffect> createState() => _NoiseEffectState();
}

class _NoiseEffectState extends State<NoiseEffect>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 50),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        Positioned.fill(
          child: IgnorePointer(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, _) {
                return CustomPaint(
                  painter: NoisePainter(
                    color: widget.color,
                    density: widget.density,
                    opacity: widget.opacity,
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class NoisePainter extends CustomPainter {
  const NoisePainter({
    this.density = 0.1, // 10% of pixels by default
    this.color = Colors.black,
    this.opacity = 1,
  });

  final double density; // Controls how many noise pixels to draw
  final Color color; // Color of the noise
  final double opacity;

  @override
  void paint(Canvas canvas, Size size) {
    final random = Random();
    final paint =
        Paint()
          ..color = color.withValues(alpha: opacity)
          ..strokeWidth = 1;

    const pixelSize = 1.0; // Size of each noise pixel
    final numberOfPixels = (size.width * size.height * density).toInt();

    for (var i = 0; i < numberOfPixels; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;

      canvas.drawRect(Rect.fromLTWH(x, y, pixelSize, pixelSize), paint);
    }
  }

  @override
  bool shouldRepaint(NoisePainter oldDelegate) {
    return true; // Always repaint to get different noise pattern
  }
}
