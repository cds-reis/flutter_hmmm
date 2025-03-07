import 'package:fpdart/fpdart.dart';

import '../entities/hotline_miami_mod.dart';
import '../entities/project_configuration.dart';
import '../errors/mod_already_exists_exception.dart';

abstract interface class HotlineMiamiModsRepository {
  Future<List<HotlineMiamiMod>> getHotlineMiamiMods(
    CustomModsFolder customModsFolder,
  );

  Future<Either<ModAlreadyExistsException, HotlineMiamiMod>> createNewMod({
    required HotlineMiamiMod mod,
    required CustomModsFolder customModsFolder,
  });
}
