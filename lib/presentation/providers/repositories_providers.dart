import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../configs/talker.dart';
import '../../data/file_system_hotline_miami_mods_repository.dart';
import '../../data/shared_prefs_project_configuration_repository.dart';
import '../../domain/repositories/hotline_miami_mods_repository.dart';
import '../../domain/repositories/project_configuration_repository.dart';

part 'repositories_providers.g.dart';

@riverpod
HotlineMiamiModsRepository hotlineMiamiModsRepository(Ref ref) {
  return FileSystemHotlineMiamiModsRepository(talker: talker);
}

@riverpod
ProjectConfigurationRepository projectConfigurationRepository(Ref ref) {
  return SharedPrefsProjectConfigurationRepository(
    prefs: ref.watch(_sharedPrefsProvider),
  );
}

@riverpod
SharedPreferencesAsync _sharedPrefs(Ref _) => SharedPreferencesAsync();
