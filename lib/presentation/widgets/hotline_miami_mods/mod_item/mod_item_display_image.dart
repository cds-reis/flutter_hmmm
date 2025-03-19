import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../domain/entities/hotline_miami_mod.dart';
import '../../utils/effects/glass_effect.dart';

class ModItemDisplayImage extends StatelessWidget {
  const ModItemDisplayImage({
    required this.mod,
    required this.opacity,
    this.height = 121,
    super.key,
  });

  final HotlineMiamiMod mod;
  final double opacity;
  final double height;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 200),
      opacity: opacity,
      child: GlassEffect(
        child: SizedBox(
          height: height,
          child: AspectRatio(
            aspectRatio: 41 / 65,
            child: Image.memory(
              mod.cover ?? Uint8List(0),
              fit: BoxFit.fill,
              filterQuality: FilterQuality.high,
            ),
          ),
        ),
      ),
    );
  }
}
