import 'dart:io';

import 'package:collection/collection.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:file_selector/file_selector.dart';
import 'package:fpdart/fpdart.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:talker/talker.dart';

import '../../domain/entities/hotline_miami_mod.dart';
import '../../domain/repositories/additional_files_repository.dart';

class FileSystemAdditionalFilesRepository implements AdditionalFilesRepository {
  const FileSystemAdditionalFilesRepository({required Talker talker})
    : _talker = talker;

  final Talker _talker;

  static const _musicFileExtension = '.wad';
  static const _modFileExtension = '.patchwad';

  @override
  Future<ModMusic?> getMusic(ModId id) async {
    final modDir = await getModDir(id);

    if (!modDir.existsSync()) {
      _talker.info('Mod directory does not exist, creating it');
      await modDir.create();
      return null;
    }

    final musicFile = await _getMusicFile(modDir);

    _talker.verbose('Music file: $musicFile');

    return musicFile.map(ModMusic.new).toNullable();
  }

  Future<Option<File>> _getMusicFile(Directory modDir) async {
    final musicDirectory = Directory(p.join(modDir.path, 'music'));

    if (!musicDirectory.existsSync()) {
      _talker.info('Music directory does not exist, creating it');
      await musicDirectory.create();
      return const Option.none();
    }

    return Option.fromNullable(
      (await musicDirectory.list().toList()).firstWhereOrNull(_isMusicFile)
          as File?,
    );
  }

  @override
  Future<ModMusic> setMusic(ModId id, XFile newMusic) async {
    final modDir = await getModDir(id);

    if (!modDir.existsSync()) {
      _talker.info('Mod directory does not exist, creating it');
      await modDir.create();
    }

    _talker.verbose('Music file: ${newMusic.name}');

    final musicFile = File(p.join(modDir.path, 'music', newMusic.name));
    _talker.verbose('Music file path: ${musicFile.path}');
    await musicFile.writeAsBytes(await newMusic.readAsBytes());

    return ModMusic(musicFile);
  }

  @override
  Future<void> removeMusic(ModId id) async {
    final modDir = await getModDir(id);

    final musicFile = await _getMusicFile(modDir);

    switch (musicFile) {
      case Some(:final value):
        await value.delete();
        _talker.info('Music ${value.path} file deleted');
      case None():
        _talker.warning('Music file does not exist');
        return;
    }
  }

  Future<Directory> getModDir(ModId id) async {
    final appSupportDir = await path_provider.getApplicationSupportDirectory();
    _talker.verbose('App support directory: ${appSupportDir.path}');
    final modDir = Directory(p.join(appSupportDir.path, id.value));
    _talker.verbose('Mod directory: ${modDir.path}');
    return modDir;
  }

  @override
  Future<AdditionalFilesDirectory> getAdditionalFilesDirectory(ModId id) {
    return getModDir(id).then(AdditionalFilesDirectory.new);
  }

  @override
  Future<IList<ModFile>> getModFiles(ModId id) async {
    final modDir = await getModDir(id);
    _talker.verbose('Mod directory: ${modDir.path}');

    if (!modDir.existsSync()) {
      _talker.info('Mod directory does not exist, creating it');
      await modDir.create();
      return const IList.empty();
    }

    return (await modDir.list().toList())
        .where(_isModFile)
        .cast<File>()
        .map(ModFile.new)
        .toIList();
  }

  @override
  Future<IList<ModFile>> setModFiles(ModId id, IList<XFile> newFiles) async {
    final modDir = await getModDir(id);

    if (!modDir.existsSync()) {
      _talker.info('Mod directory for $id does not exist, creating it');
      await modDir.create();
    }

    for (final file in newFiles) {
      final modFile = File(p.join(modDir.path, file.name));
      _talker.verbose('Writing mod file: ${modFile.path}');
      await modFile.writeAsBytes(await file.readAsBytes());
    }

    return newFiles
        .map((file) => ModFile(File(p.join(modDir.path, file.name))))
        .toIList();
  }
}

bool _isMusicFile(FileSystemEntity entity) {
  return FileSystemEntity.isFileSync(entity.path) &&
      p.extension(entity.path) ==
          FileSystemAdditionalFilesRepository._musicFileExtension;
}

bool _isModFile(FileSystemEntity entity) {
  return FileSystemEntity.isFileSync(entity.path) &&
      p.extension(entity.path) ==
          FileSystemAdditionalFilesRepository._modFileExtension;
}
