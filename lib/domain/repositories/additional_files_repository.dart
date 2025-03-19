import 'package:cross_file/cross_file.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

import '../entities/hotline_miami_mod.dart';

abstract interface class AdditionalFilesRepository {
  Future<ModMusic?> getMusic(ModId id);

  Future<IList<ModFile>> getModFiles(ModId id);

  Future<AdditionalFilesDirectory> getAdditionalFilesDirectory(ModId id);

  Future<ModMusic> setMusic(ModId id, XFile newMusic);

  Future<IList<ModFile>> setModFiles(ModId id, IList<XFile> newFiles);

  Future<void> removeMusic(ModId id);
}
