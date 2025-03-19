import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../../../domain/entities/hotline_miami_mod.dart';
import '../utils/animations/swaying_widget.dart';
import '../utils/effects/cassete_border_effect.dart';

class SelectedModImage extends StatelessWidget {
  const SelectedModImage({required this.mod, super.key});

  final HotlineMiamiMod mod;

  @override
  Widget build(BuildContext context) {
    return SwayingWidget(
      child: CasseteBorderEffect(
        child: SizedBox(
          height: 300,
          child: AspectRatio(
            aspectRatio: 34 / 57,
            child: Image.memory(
              mod.cover ?? Uint8List(0),
              fit: BoxFit.fill,
              filterQuality: FilterQuality.high,
              isAntiAlias: true,
              gaplessPlayback: true,
            ),
          ),
        ),
      ),
    );
  }
}
