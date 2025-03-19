import 'dart:async';

import 'package:collection/collection.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/hotline_miami_mod.dart';
import '../widgets/hotline_miami_mods/hotline_miami_mods_display.dart';
import 'global_providers.dart';
import 'project_configuration_provider.dart';
import 'repositories_providers.dart';

part 'current_mod_provider.g.dart';

@riverpod
class CurrentMod extends _$CurrentMod {
  static const _currentModIdKey = 'currentModId';

  @override
  Future<HotlineMiamiMod?> build() async {
    state = const AsyncLoading();
    final sharedPreferences = ref.watch(sharedPreferencesProvider);
    final mods = await ref.watch(hotlineMiamiModsProvider.future);

    final currentModId =
        Option.fromNullable(
          await sharedPreferences.getString(_currentModIdKey),
        ).map(ModId.new).toNullable();

    return mods.firstWhereOrNull((mod) => mod.id == currentModId);
  }

  Future<void> setCurrentMod(HotlineMiamiMod mod) async {
    state = const AsyncLoading();

    final projectConfiguration = await ref.read(
      projectConfigurationNotifierProvider.future,
    );

    if (projectConfiguration == null) {
      ref.read(talkerProvider).error('Project configuration not found');
      return;
    }

    await ref
        .read(hotlineMiamiModsRepositoryProvider)
        .setCurrentMod(projectConfiguration: projectConfiguration, mod: mod);

    unawaited(
      ref
          .read(sharedPreferencesProvider)
          .setString(_currentModIdKey, mod.id.value),
    );

    state = AsyncData(mod);
  }

  Future<void> useDefault() async {
    state = const AsyncLoading();

    final projectConfiguration = await ref.read(
      projectConfigurationNotifierProvider.future,
    );

    if (projectConfiguration == null) {
      ref.read(talkerProvider).error('Project configuration not found');
      return;
    }

    await ref
        .read(hotlineMiamiModsRepositoryProvider)
        .useDefault(projectConfiguration: projectConfiguration);

    state = const AsyncData(null);
  }
}
