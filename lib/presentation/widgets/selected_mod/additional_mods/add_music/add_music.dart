import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:path/path.dart' as p;

import '../../../../../../domain/entities/hotline_miami_mod.dart';
import 'add_music_button.dart';
import 'remove_music_button.dart';

class AddMusic extends StatelessWidget {
  const AddMusic({required this.mod, super.key});

  final HotlineMiamiMod mod;

  @override
  Widget build(BuildContext context) {
    final music = mod.music;

    return SizedBox(
      height: 48,
      child: Wrap(
        runAlignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 8,
        runSpacing: 8,
        children: [
          AddMusicButton(mod: mod),
          Text(
            Option.fromNullable(
              mod.music?.path,
            ).map(p.basename).getOrElse(() => 'No music'),
            style: Theme.of(context).textTheme.bodySmall,
          ),
          if (music != null) ...[RemoveMusicButton(mod: mod)],
        ],
      ),
    );
  }
}
