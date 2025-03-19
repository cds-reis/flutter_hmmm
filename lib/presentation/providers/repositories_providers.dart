import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/repositories/file_system_additional_files_repository.dart';
import '../../data/repositories/file_system_hotline_miami_mods_repository.dart';
import '../../data/repositories/file_system_music_repository.dart';
import '../../data/repositories/shared_prefs_project_configuration_repository.dart';
import '../../domain/repositories/additional_files_repository.dart';
import '../../domain/repositories/hotline_miami_mods_repository.dart';
import '../../domain/repositories/music_repository.dart';
import '../../domain/repositories/project_configuration_repository.dart';
import 'global_providers.dart';

part 'repositories_providers.g.dart';

@riverpod
MusicRepository musicRepository(Ref ref) {
  return FileSystemMusicRepository(talker: ref.watch(talkerProvider));
}

@riverpod
HotlineMiamiModsRepository hotlineMiamiModsRepository(Ref ref) {
  return FileSystemHotlineMiamiModsRepository(
    talker: ref.watch(talkerProvider),
    additionalFilesRepository: ref.watch(additionalFilesRepositoryProvider),
    musicRepository: ref.watch(musicRepositoryProvider),
  );
}

@riverpod
ProjectConfigurationRepository projectConfigurationRepository(Ref ref) {
  return SharedPrefsProjectConfigurationRepository(
    prefs: ref.watch(sharedPreferencesProvider),
  );
}

@riverpod
AdditionalFilesRepository additionalFilesRepository(Ref ref) {
  return FileSystemAdditionalFilesRepository(talker: ref.watch(talkerProvider));
}

@riverpod
SharedPreferencesAsync sharedPreferences(Ref _) => SharedPreferencesAsync();
