import 'dart:io';

import 'package:file_selector/file_selector.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:talker/talker.dart';

import '../../domain/entities/default_hotline_miami_music.dart';
import '../../domain/repositories/music_repository.dart';

class FileSystemMusicRepository implements MusicRepository {
  const FileSystemMusicRepository({required Talker talker}) : _talker = talker;

  final Talker _talker;

  @override
  Future<DefaultHotlineMiamiMusic> saveMusic(XFile music) async {
    final file = await _getMusicFile();
    _talker.verbose('Saving music to: ${file.path}');
    await file.writeAsBytes(await music.readAsBytes());
    return DefaultHotlineMiamiMusic(file);
  }

  @override
  Future<DefaultHotlineMiamiMusic?> getMusic() async {
    final file = await _getMusicFile();

    if (!file.existsSync()) {
      _talker.verbose('No music file found');
      return null;
    }

    _talker.verbose('Music file: ${file.path}');

    if (file.existsSync()) {
      return DefaultHotlineMiamiMusic(file);
    }

    return null;
  }

  Future<File> _getMusicFile() async {
    final directory = await path_provider.getApplicationSupportDirectory();
    final file = File(p.join(directory.path, 'default_music.wad'));
    _talker.verbose('Music file: ${file.path}');
    return file;
  }
}
