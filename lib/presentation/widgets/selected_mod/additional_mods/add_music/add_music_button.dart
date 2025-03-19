import 'dart:async';

import 'package:archive/archive.dart';
import 'package:collection/collection.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path/path.dart' as p;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../domain/entities/hotline_miami_mod.dart';
import '../../../../providers/repositories_providers.dart';
import '../../../../providers/selected_mod_provider.dart';
import '../../../hotline_miami_mods/hotline_miami_mods_display.dart';
import '../../../utils/dialogs/default_dialog.dart';

part 'add_music_button.g.dart';

@riverpod
Future<void> addMusic(Ref ref, HotlineMiamiMod mod, XFile music) async {
  final repository = ref.watch(additionalFilesRepositoryProvider);

  final modMusic = await repository.setMusic(mod.id, music);

  final newMod = mod.copyWith(music: modMusic);

  ref.watch(selectedModProvider.notifier).set(newMod);
  ref.watch(hotlineMiamiModsProvider.notifier).updateMod(newMod);
}

class AddMusicButton extends ConsumerWidget {
  const AddMusicButton({required this.mod, super.key});

  final HotlineMiamiMod mod;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton.icon(
      onPressed: () async {
        final music = await openFile(
          acceptedTypeGroups: [
            const XTypeGroup(extensions: ['wad', 'zip']),
          ],
        );

        if (music == null) {
          return;
        }

        switch (p.extension(music.path)) {
          case '.zip':
            final bytes = await compute(_parseZip, music);

            if (bytes != null) {
              final musicFile = XFile.fromData(
                bytes,
                path: p.setExtension(music.path, '.wad'),
              );

              ref.read(addMusicProvider(mod, musicFile));
            } else {
              if (context.mounted) {
                showDialog<void>(
                  context: context,
                  builder: (context) {
                    return const DefaultDialog(
                      child: Text('No music file found in zip'),
                    );
                  },
                ).ignore();
              }
            }
          case '.wad':
            ref.read(addMusicProvider(mod, music));
          default:
            if (context.mounted) {
              showDialog<void>(
                context: context,
                builder: (context) {
                  return const DefaultDialog(child: Text('Invalid file type'));
                },
              ).ignore();
            }
        }
      },
      label: const Text('Add music'),
      iconAlignment: IconAlignment.end,
      icon: const Icon(Icons.music_note_sharp),
    );
  }
}

Future<Uint8List?> _parseZip(XFile music) async {
  final stream = InputMemoryStream(await music.readAsBytes());
  final archive = ZipDecoder().decodeStream(stream);

  final zippedMusic =
      archive.files
          .where((file) => file.isFile)
          .where((file) => p.extension(file.name) == '.wad')
          .firstOrNull;

  if (zippedMusic == null) {
    return null;
  }

  return zippedMusic.readBytes();
}
