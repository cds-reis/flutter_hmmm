// ignore_for_file: unused_element, unused_local_variable // Work in progress

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CassetteLoadingAnimation extends HookWidget {
  const CassetteLoadingAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CassetteLoadingPainter(),
      size: const Size(
        CassetteLoadingPainter._casseteWidth,
        CassetteLoadingPainter._casseteHeight,
      ),
    );
  }
}

class CassetteLoadingPainter extends CustomPainter {
  static const _pixelSize = 4.0;
  static const _casseteWidth = 27.0 * _pixelSize;
  static const _casseteHeight = 16.0 * _pixelSize;

  @override
  void paint(Canvas canvas, Size size) {
    // const _BorderCassetePainter(
    //   pixelSize: _pixelSize,
    //   casseteWidth: _casseteWidth,
    //   casseteHeight: _casseteHeight,
    // ).paint(canvas, size);

    const _OutsideCassettePainter(
      pixelSize: _pixelSize,
      casseteWidth: _casseteWidth,
      casseteHeight: _casseteHeight,
    ).paint(canvas, size);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class _OutsideCassettePainter {
  const _OutsideCassettePainter({
    required this.pixelSize,
    required this.casseteWidth,
    required this.casseteHeight,
  });

  final double pixelSize;
  final double casseteWidth;
  final double casseteHeight;

  void paint(Canvas canvas, Size size) {
    final veryLightGreenPaint =
        Paint()..color = const Color.fromRGBO(73, 115, 60, 1);

    final darkGreenPaint = Paint()..color = const Color.fromRGBO(14, 36, 15, 1);
    final lightGreenPaint =
        Paint()..color = const Color.fromRGBO(50, 99, 36, 1);
    final greenPaint = Paint()..color = const Color.fromARGB(255, 37, 77, 25);

    final greyPaint = Paint()..color = const Color.fromRGBO(159, 160, 160, 1);

    _paintDarkGreen(canvas, darkGreenPaint);
    for (final _ in List.generate(60, (index) => index)) {
      _paintVeryLightGreen(canvas, veryLightGreenPaint);
      _paintLightGreen(canvas, lightGreenPaint);
    }
    // _paintBottomDecoration(canvas);

    // _paintFirstLine(canvas, greyPaint, greenPaint, lightGreenPaint);
    // _paintSecondLine(canvas, greyPaint, greenPaint, lightGreenPaint);

    // _paintEdges(canvas, lightGreenPaint);
  }

  void _paintDarkGreen(Canvas canvas, Paint darkGreenPaint) {
    canvas.drawRect(
      Rect.fromLTWH(0, 0, casseteWidth, casseteHeight),
      darkGreenPaint,
    );
  }

  void _paintLightGreen(Canvas canvas, Paint lightGreenPaint) {
    canvas
      ..drawRect(
        Rect.fromLTWH(
          pixelSize,
          pixelSize,
          casseteWidth - pixelSize * 2,
          pixelSize * 10,
        ),
        lightGreenPaint,
      )
      ..drawRect(
        Rect.fromLTWH(
          pixelSize * 3,
          pixelSize * 11,
          casseteWidth - pixelSize * 6,
          pixelSize,
        ),
        lightGreenPaint,
      )
      ..drawRect(
        Rect.fromLTWH(
          pixelSize * 4,
          pixelSize * 12,
          casseteWidth - pixelSize * 8,
          pixelSize,
        ),
        lightGreenPaint,
      );
  }

  void _paintVeryLightGreen(Canvas canvas, Paint veryLightGreenPaint) {
    canvas.drawRect(
      Rect.fromLTWH(
        pixelSize,
        pixelSize * 11,
        casseteWidth - pixelSize * 2,
        pixelSize * 4,
      ),
      veryLightGreenPaint,
    );
  }

  // void _paintBorderDecoration(
  //   Canvas canvas,
  //   Paint darkGreenPaint,
  //   Paint lightGreenPaint,
  //   Paint veryLightGreenPaint,
  //   Paint greyPaint,
  // ) {
  //   canvas..drawRect(Rect.fromLTWH(left, top, width, height), paint);
  // }

  void _paintFirstLine(
    Canvas canvas,
    Paint greyPaint,
    Paint greenPaint,
    Paint lightGreenPaint,
  ) {
    canvas
      ..drawRect(
        Rect.fromLTWH(pixelSize, pixelSize, pixelSize, pixelSize),
        greyPaint,
      )
      ..drawRect(
        Rect.fromLTWH(pixelSize * 2, pixelSize, pixelSize, pixelSize),
        greenPaint,
      )
      ..drawRect(
        Rect.fromLTWH(
          pixelSize * 3,
          pixelSize,
          casseteWidth - pixelSize * 6,
          pixelSize,
        ),
        lightGreenPaint,
      )
      ..drawRect(
        Rect.fromLTWH(
          casseteWidth - pixelSize * 3,
          pixelSize,
          pixelSize,
          pixelSize,
        ),
        greenPaint,
      )
      ..drawRect(
        Rect.fromLTWH(
          casseteWidth - pixelSize * 2,
          pixelSize,
          pixelSize,
          pixelSize,
        ),
        greyPaint,
      );
  }

  void _paintSecondLine(
    Canvas canvas,
    Paint greyPaint,
    Paint greenPaint,
    Paint lightGreenPaint,
  ) {
    final top = pixelSize * 2;
    canvas
      ..drawRect(
        Rect.fromLTWH(pixelSize, top, pixelSize, pixelSize),
        greenPaint,
      )
      ..drawRect(
        Rect.fromLTWH(pixelSize * 2, top, pixelSize, pixelSize),
        lightGreenPaint,
      )
      ..drawRect(
        Rect.fromLTWH(casseteWidth - pixelSize * 3, top, pixelSize, pixelSize),
        lightGreenPaint,
      )
      ..drawRect(
        Rect.fromLTWH(casseteWidth - pixelSize * 2, top, pixelSize, pixelSize),
        greenPaint,
      );
  }

  void _paintEdges(Canvas canvas, Paint lightGreenPaint) {
    final height = pixelSize * 8;
    final top = pixelSize * 3;

    canvas
      ..drawRect(
        Rect.fromLTWH(pixelSize, top, pixelSize, height),
        lightGreenPaint,
      )
      ..drawRect(
        Rect.fromLTWH(casseteWidth - pixelSize * 2, top, pixelSize, height),
        lightGreenPaint,
      )
      ..drawRect(
        Rect.fromLTWH(
          pixelSize,
          top + height - pixelSize,
          pixelSize * 2,
          pixelSize,
        ),
        lightGreenPaint,
      )
      ..drawRect(
        Rect.fromLTWH(
          casseteWidth - pixelSize * 3,
          top + height - pixelSize,
          pixelSize * 2,
          pixelSize,
        ),
        lightGreenPaint,
      );
  }
}
