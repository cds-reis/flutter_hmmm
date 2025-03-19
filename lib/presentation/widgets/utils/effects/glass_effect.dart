import 'package:flutter/material.dart';

class GlassEffect extends StatelessWidget {
  const GlassEffect({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        const Positioned.fill(
          child: IgnorePointer(child: CustomPaint(painter: GlassPainter())),
        ),
      ],
    );
  }
}

class GlassPainter extends CustomPainter {
  const GlassPainter();

  static const _pixelHorizontalAmount = 34;
  static const _pixelVerticalAmount = 57;

  @override
  void paint(Canvas canvas, Size size) {
    final clearPaint =
        Paint()
          ..color = Colors.white.withValues(alpha: .35)
          ..style = PaintingStyle.fill;

    final opaquePaint =
        Paint()
          ..color = Colors.white.withValues(alpha: .05)
          ..style = PaintingStyle.fill;

    final pixelWidth = size.width / _pixelHorizontalAmount;
    final pixelHeight = size.height / _pixelVerticalAmount;

    final grid = _effectPoisitions;

    for (var i = 0; i < grid.length; i++) {
      final row = grid[i];

      for (var j = 0; j < row.length; j++) {
        final isEffect = row[j];

        canvas.drawRect(
          Rect.fromLTWH(
            j * pixelWidth,
            i * pixelHeight,
            pixelWidth,
            pixelHeight,
          ),
          isEffect ? clearPaint : opaquePaint,
        );
      }
    }

    canvas
      ..drawRect(
        Rect.fromLTWH(
          -pixelHeight,
          -pixelHeight,
          size.width + pixelWidth,
          pixelHeight,
        ),
        Paint()..color = Colors.black,
      )
      ..drawRect(
        Rect.fromLTWH(
          -pixelHeight,
          size.height,
          size.width + pixelWidth,
          pixelHeight,
        ),
        Paint()..color = Colors.black,
      )
      ..drawRect(
        Rect.fromLTWH(-pixelHeight, 0, pixelWidth, size.height),
        Paint()..color = Colors.grey,
      )
      ..drawRect(
        Rect.fromLTWH(size.width, 0, pixelWidth, size.height),
        Paint()..color = Colors.black,
      );
  }

  static final _effectPoisitions = _calculateEffectPositions();

  static List<List<bool>> _calculateEffectPositions() {
    final grid = _initialGrid();

    // Start from second-to-last row and work up
    for (var rowIndex = grid.length - 2; rowIndex >= 0; rowIndex--) {
      final row = grid[rowIndex];
      // Start from second column since first column is already initialized
      for (var columnIndex = 1; columnIndex < row.length; columnIndex++) {
        // Check cell diagonally down and to the left
        final belowRow = grid[rowIndex + 1];
        final cellBelowLeft = belowRow[columnIndex - 1];

        if (cellBelowLeft) {
          row[columnIndex] = true;
        }
      }
    }

    return grid;
  }

  static List<List<bool>> _initialGrid() {
    final grid = List.generate(
      _pixelVerticalAmount,
      (_) => List.generate(_pixelHorizontalAmount, (_) => false),
    );

    for (var rowIndex = 0; rowIndex < grid.length; rowIndex++) {
      final row = grid[rowIndex];

      const columnIndex = 0;

      if (_firstColumnClearerIndexes.contains(rowIndex)) {
        row[columnIndex] = true;
      }
    }

    final lastRow = grid.last;

    for (var i = 0; i < lastRow.length; i++) {
      if (_lastRowClearerIndexes.contains(i)) {
        lastRow[i] = true;
      }
    }

    return grid;
  }

  static final _firstColumnClearerIndexes = <int>[
    7,
    8,
    9,
    16,
    21,
    22,
    23,
    33,
    34,
    35,
    36,
    37,
    38,
    39,
    40,
    41,
    44,
    45,
    48,
  ];

  static final _lastRowClearerIndexes = <int>[
    8,
    9,
    10,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    33,
  ];

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
