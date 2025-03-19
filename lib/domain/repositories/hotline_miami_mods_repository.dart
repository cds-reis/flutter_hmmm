import 'package:fast_immutable_collections/fast_immutable_collections.dart';

import '../entities/hotline_miami_mod.dart';
import '../entities/project_configuration.dart';

abstract interface class HotlineMiamiModsRepository {
  Future<IList<HotlineMiamiMod>> getHotlineMiamiMods(
    ProjectConfiguration projectConfiguration,
  );

  Future<void> setCurrentMod({
    required ProjectConfiguration projectConfiguration,
    required HotlineMiamiMod mod,
  });

  Future<void> useDefault({required ProjectConfiguration projectConfiguration});
}
