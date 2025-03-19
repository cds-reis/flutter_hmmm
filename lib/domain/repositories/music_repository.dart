import 'package:cross_file/cross_file.dart';

import '../entities/default_hotline_miami_music.dart';

abstract interface class MusicRepository {
  Future<DefaultHotlineMiamiMusic> saveMusic(XFile music);

  Future<DefaultHotlineMiamiMusic?> getMusic();
}
