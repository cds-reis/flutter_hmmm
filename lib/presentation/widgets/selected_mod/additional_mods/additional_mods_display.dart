import 'package:flutter/material.dart';

import '../../../../domain/entities/hotline_miami_mod.dart';
import 'add_music/add_music.dart';
import 'mod_files_display/mod_files_amount.dart';
import 'mod_files_display/mod_files_drop_target.dart';
import 'mod_files_display/mod_files_folder_button.dart';
import 'mod_files_display/refresh_mods_button.dart';

class AdditionalModsDisplay extends StatelessWidget {
  const AdditionalModsDisplay({required this.mod, super.key});

  final HotlineMiamiMod mod;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16,
      children: [
        AddMusic(mod: mod),
        ModFilesAmount(mod: mod),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            ModFilesFolderButton(mod: mod),
            RefreshModsButton(mod: mod),
          ],
        ),
        const ModFilesDropTarget(),
      ],
    );
  }
}
