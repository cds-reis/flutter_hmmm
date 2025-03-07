import '../entities/hotline_miami_mod.dart';

class ModAlreadyExistsException implements Exception {
  const ModAlreadyExistsException(this.modName);

  final HotlineMiamiModName modName;
}
