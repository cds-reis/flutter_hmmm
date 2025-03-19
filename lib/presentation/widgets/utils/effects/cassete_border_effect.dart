import 'package:flutter/material.dart';

class CasseteBorderEffect extends StatelessWidget {
  const CasseteBorderEffect({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: const CasseteBorderPainter(), child: child);
  }
}

class CasseteBorderPainter extends CustomPainter {
  const CasseteBorderPainter();

  static const _pixelHorizontalAmount = 34;
  static const _pixelVerticalAmount = 57;

  @override
  void paint(Canvas canvas, Size size) {
    final pixelWidth = size.width / _pixelHorizontalAmount;
    final pixelHeight = size.height / _pixelVerticalAmount;

    drawLeftBorder(canvas, size, pixelWidth, pixelHeight);
    drawTopBorder(canvas, size, pixelWidth, pixelHeight);
    drawRightBorder(canvas, size, pixelWidth, pixelHeight);
    drawBottomBorder(canvas, size, pixelWidth, pixelHeight);
  }

  void drawTopBorder(
    Canvas canvas,
    Size size,
    double pixelWidth,
    double pixelHeight,
  ) {
    canvas.drawRect(
      Rect.fromLTWH(
        -pixelHeight,
        -pixelHeight,
        size.width + pixelWidth,
        pixelHeight,
      ),
      Paint()..color = Colors.black,
    );
  }

  void drawBottomBorder(
    Canvas canvas,
    Size size,
    double pixelWidth,
    double pixelHeight,
  ) {
    canvas.drawRect(
      Rect.fromLTWH(
        -pixelHeight,
        size.height,
        size.width + pixelWidth,
        pixelHeight,
      ),
      Paint()..color = Colors.black,
    );
  }

  void drawLeftBorder(
    Canvas canvas,
    Size size,
    double pixelWidth,
    double pixelHeight,
  ) {
    canvas.drawRect(
      Rect.fromLTWH(-pixelHeight, 0, pixelWidth, size.height),
      Paint()..color = Colors.grey,
    );
  }

  void drawRightBorder(
    Canvas canvas,
    Size size,
    double pixelWidth,
    double pixelHeight,
  ) {
    canvas.drawRect(
      Rect.fromLTWH(size.width, 0, pixelWidth, size.height),
      Paint()..color = Colors.black,
    );
  }

  @override
  bool shouldRepaint(CasseteBorderPainter oldDelegate) {
    return false;
  }
}
