import 'package:flutter/material.dart';

import '../../../domain/entities/hotline_miami_mod.dart';

class SelectedModImage extends StatelessWidget {
  const SelectedModImage({required this.mod, super.key});

  final HotlineMiamiMod mod;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          boxShadow: [BoxShadow(spreadRadius: 8, blurRadius: 4)],
        ),
        child: switch (mod.screen) {
          final ModScreen screen => Image.memory(
            screen,
            fit: BoxFit.fill,
            filterQuality: FilterQuality.high,
            isAntiAlias: true,
            gaplessPlayback: true,
          ),
          null => const SizedBox.shrink(),
        },
      ),
    );
  }
}
