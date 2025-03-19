import 'dart:io';

import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:path/path.dart' as p;
import 'package:talker/talker.dart';

import '../../domain/entities/hotline_miami_mod.dart';
import '../../domain/entities/project_configuration.dart';
import '../../domain/errors/mods_folder_not_found_exception.dart';
import '../../domain/repositories/additional_files_repository.dart';
import '../../domain/repositories/hotline_miami_mods_repository.dart';
import '../../domain/repositories/music_repository.dart';
import '../models/hotline_miami_mod_model.dart';

class FileSystemHotlineMiamiModsRepository
    implements HotlineMiamiModsRepository {
  const FileSystemHotlineMiamiModsRepository({
    required Talker talker,
    required AdditionalFilesRepository additionalFilesRepository,
    required MusicRepository musicRepository,
  }) : _talker = talker,
       _additionalFilesRepository = additionalFilesRepository,
       _musicRepository = musicRepository;

  final Talker _talker;
  final AdditionalFilesRepository _additionalFilesRepository;
  final MusicRepository _musicRepository;

  static const _musicFileName = 'hlm2_music_desktop.wad';

  @override
  Future<IList<HotlineMiamiMod>> getHotlineMiamiMods(
    ProjectConfiguration projectConfiguration,
  ) async {
    final gamePath = Directory(projectConfiguration.gamePath.path);
    final steamAppsPath = gamePath.parent.parent;
    final modsFolder = Directory(
      p.join(steamAppsPath.path, 'workshop', 'content', '274170'),
    );

    if (!modsFolder.existsSync()) {
      _talker.error('Mods folder not found: ${modsFolder.path}');
      throw ModsFolderNotFoundException(path: modsFolder.path);
    }

    final modsDirectory =
        (await modsFolder.list().toList()).whereType<Directory>().toList();

    final mods =
        (await modsDirectory.map(HotlineMiamiModModel.fromDirectory).wait)
            .sortBy(Order.from((mod1, mod2) => mod1.name.compareTo(mod2.name)))
            .toList();

    final modsWithMusic = await Future.wait(
      mods.map((mod) async {
        final music = await _additionalFilesRepository.getMusic(mod.id);

        return mod.copyWith(music: music);
      }),
    );

    final modsWithFiles = await Future.wait(
      modsWithMusic.map((mod) async {
        final additionalFilesDirectory = await _additionalFilesRepository
            .getAdditionalFilesDirectory(mod.id);
        final modFiles = await _additionalFilesRepository.getModFiles(mod.id);

        return mod.copyWith(
          files: modFiles,
          additionalFilesDirectory: additionalFilesDirectory,
        );
      }),
    );

    return modsWithFiles.toIList();
  }

  @override
  Future<void> setCurrentMod({
    required ProjectConfiguration projectConfiguration,
    required HotlineMiamiMod mod,
  }) async {
    final gameDirectory = projectConfiguration.gamePath;
    final additionalModsDirectory = projectConfiguration.additionalModsPath;

    await (
      _changeCurrentMusic(gameDirectory, mod),
      _changeCurrentModFiles(additionalModsDirectory, mod),
    ).wait;
  }

  Future<void> _changeCurrentModFiles(
    AdditionalModsPath additionalModsDirectory,
    HotlineMiamiMod mod,
  ) async {
    final deletions = <AsyncCallback>[];

    await for (final entity in additionalModsDirectory.list()) {
      if (entity is File && p.extension(entity.path) == '.patchwad') {
        deletions.add(entity.delete);
      }
    }

    await deletions.map((delete) => delete()).wait;

    await mod.files.map((file) {
      return file.copy(p.join(additionalModsDirectory.path, file.name));
    }).wait;
  }

  Future<void> _changeCurrentMusic(
    GamePath gameDirectory,
    HotlineMiamiMod mod,
  ) async {
    final defaultMusicFile = await _musicRepository.getMusic();

    if (defaultMusicFile == null) {
      _talker.error(
        'The music file has not been set correctly. Please set the music file correctly within the program',
      );
    }

    final musicFile = File(p.join(gameDirectory.path, _musicFileName));

    // if the mod has a new music file, copy it to the game directory
    if (mod.music case final music?) {
      await music.readAsBytes().then(musicFile.writeAsBytes);
    } else if (musicFile.lengthSync() == defaultMusicFile?.lengthSync()) {
      // the current file is probably the default one, so we don't need to do anything
    } else {
      await defaultMusicFile?.readAsBytes().then(musicFile.writeAsBytes);
    }
  }

  @override
  Future<void> useDefault({
    required ProjectConfiguration projectConfiguration,
  }) async {
    final defaultMusicFile = await _musicRepository.getMusic();

    if (defaultMusicFile == null) {
      _talker.error(
        'The music file has not been set correctly. Please set the music file correctly within the program',
      );
      throw StateError(
        'The music file has not been set correctly. Please set the music file correctly within the program',
      );
    }

    final musicFile = File(
      p.join(projectConfiguration.gamePath.path, _musicFileName),
    );

    await defaultMusicFile.readAsBytes().then(musicFile.writeAsBytes);
  }
}
