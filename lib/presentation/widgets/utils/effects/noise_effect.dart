import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../project_configuration/noise_effect_enabled_button.dart';

class NoiseEffect extends ConsumerWidget {
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
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        child,
        Positioned.fill(
          child: IgnorePointer(
            child: CustomPaint(
              painter: NoisePainter(
                color: color,
                density: density,
                opacity: opacity,
                enabled: ref.watch(noiseEffectEnabledProvider),
              ),
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
    this.enabled = true,
  });

  final double density; // Controls how many noise pixels to draw
  final Color color; // Color of the noise
  final double opacity;
  final bool enabled;

  @override
  void paint(Canvas canvas, Size size) {
    if (!enabled) return;

    final random = Random();
    final paint =
        Paint()
          ..color = color.withValues(alpha: opacity)
          ..strokeWidth = 1;

    const pixelSize = 1.0;
    final numberOfPixels = (size.width * size.height * density).toInt();

    for (var i = 0; i < numberOfPixels; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;

      canvas.drawRect(Rect.fromLTWH(x, y, pixelSize, pixelSize), paint);
    }
  }

  @override
  bool shouldRepaint(NoisePainter oldDelegate) {
    return enabled;
  }
}
