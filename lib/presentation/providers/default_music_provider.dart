import 'package:file_selector/file_selector.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/default_hotline_miami_music.dart';
import 'global_providers.dart';
import 'repositories_providers.dart';

part 'default_music_provider.g.dart';

@riverpod
class DefaultMusic extends _$DefaultMusic {
  @override
  Future<DefaultHotlineMiamiMusic?> build() {
    return ref.watch(musicRepositoryProvider).getMusic();
  }

  Future<void> set(XFile music) async {
    state = const AsyncLoading();
    ref.read(talkerProvider).verbose('Setting default music: $music');
    final savedMusic = await ref.read(musicRepositoryProvider).saveMusic(music);
    state = AsyncData(savedMusic);
  }
}
