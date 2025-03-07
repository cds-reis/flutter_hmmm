import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:path/path.dart' as p;
import 'package:talker/talker.dart';

import '../domain/entities/hotline_miami_mod.dart';
import '../domain/entities/project_configuration.dart';
import '../domain/errors/mod_already_exists_exception.dart';
import '../domain/repositories/hotline_miami_mods_repository.dart';

class FileSystemHotlineMiamiModsRepository
    implements HotlineMiamiModsRepository {
  const FileSystemHotlineMiamiModsRepository({required Talker talker})
    : _talker = talker;

  final Talker _talker;

  @override
  Future<List<HotlineMiamiMod>> getHotlineMiamiMods(
    CustomModsFolder customModsFolder,
  ) async {
    final mods =
        customModsFolder
            .listSync()
            .where((entity) => FileSystemEntity.isDirectorySync(entity.path))
            .map((entity) => Directory(entity.path))
            .map(HotlineMiamiMod.fromDirectory)
            .toList();

    return mods.fold<List<HotlineMiamiMod>>([], (validMods, current) {
      switch (current) {
        case Right(:final value):
          return [...validMods, value];
        case Left(:final value):
          _talker.error(
            'The recieved directory is not a valid hotline miami mod: $value',
          );

          return validMods;
      }
    });
  }

  @override
  Future<Either<ModAlreadyExistsException, HotlineMiamiMod>> createNewMod({
    required HotlineMiamiMod mod,
    required CustomModsFolder customModsFolder,
  }) async {
    final modPath = Directory(p.join(customModsFolder.path, mod.name));
    if (modPath.existsSync()) {
      return Left(ModAlreadyExistsException(mod.name));
    }

    modPath.createSync();

    return Right(mod);
  }
}
