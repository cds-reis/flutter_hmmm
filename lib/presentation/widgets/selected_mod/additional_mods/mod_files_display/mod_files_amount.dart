import 'package:flutter/material.dart';

import '../../../../../../domain/entities/hotline_miami_mod.dart';

class ModFilesAmount extends StatelessWidget {
  const ModFilesAmount({required this.mod, super.key});

  final HotlineMiamiMod mod;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: 'Mod Files',
        style: Theme.of(context).textTheme.titleMedium,
        children: [
          if (mod.files.isNotEmpty)
            TextSpan(
              text: ' (${mod.files.length})',
              style: Theme.of(context).textTheme.bodySmall,
            )
          else
            TextSpan(
              text: ' (0)',
              style: Theme.of(context).textTheme.bodySmall,
            ),
        ],
      ),
    );
  }
}
