import 'dart:math';

import 'package:flutter/widgets.dart';

class PixelPainter {
  const PixelPainter({
    required this.pixelSize,
    required this.width,
    required this.height,
  });

  final Size pixelSize;
  final int width;
  final int height;

  void paint({
    required Canvas canvas,
    required Offset startPosition,
    required Offset endPosition,
    required Color color,
  }) {
    final paint = Paint()..color = color;

    canvas.drawRect(
      Rect.fromLTWH(
        startPosition.dx,
        startPosition.dy,
        min(endPosition.dx - startPosition.dx, width.toDouble()),
        min(endPosition.dy - startPosition.dy, height.toDouble()),
      ),
      paint,
    );
  }
}
