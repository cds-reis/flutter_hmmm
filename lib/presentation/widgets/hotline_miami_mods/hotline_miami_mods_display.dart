import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/entities/hotline_miami_mod.dart';
import '../../providers/global_providers.dart';
import '../../providers/project_configuration_provider.dart';
import '../../providers/repositories_providers.dart';
import '../selected_mod/selected_mod_display.dart';
import '../utils/effects/noise_effect.dart';
import 'mods_scroll_view/mods_scroll_view.dart';
import 'no_mods_found.dart';

part 'hotline_miami_mods_display.g.dart';

@Riverpod(keepAlive: true)
class HotlineMiamiMods extends _$HotlineMiamiMods {
  @override
  Future<IList<HotlineMiamiMod>> build() {
    state = const AsyncLoading();
    final talker = ref.watch(talkerProvider)
      ..verbose('Building HotlineMiamiMods');
    final projectConfiguration =
        ref.watch(projectConfigurationNotifierProvider).value;

    if (projectConfiguration == null) {
      talker.error('Project configuration is null');
      return Future.value(const IList.empty());
    }

    talker.verbose('Getting hotline miami mods');

    return ref
        .watch(hotlineMiamiModsRepositoryProvider)
        .getHotlineMiamiMods(projectConfiguration);
  }

  void updateMod(HotlineMiamiMod mod) {
    final talker = ref.read(talkerProvider)..info('Updating mod: $mod');
    final mods = state.value;

    if (mods == null) {
      talker.error('Mods is null');
      return;
    }

    final modIndex = mods.indexWhere((m) => m.id == mod.id);

    state = AsyncData(mods.replace(modIndex, mod));
  }
}

class HotlineMiamiModsDisplay extends ConsumerWidget {
  const HotlineMiamiModsDisplay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Flexible(
          flex: 60,
          child: NoiseEffect(
            color: Colors.black,
            opacity: 0.3,
            child: switch (ref.watch(hotlineMiamiModsProvider)) {
              AsyncData(value: IList(isEmpty: true)) => const NoModsFound(),
              AsyncData(value: final mods) => ModsScrollView(mods: mods),
              AsyncError(:final error) => Text(error.toString()),
              AsyncLoading() => const SizedBox.expand(
                child: Center(child: CircularProgressIndicator()),
              ),
              _ => throw UnimplementedError(),
            },
          ),
        ),
        const Expanded(child: NoiseEffect(child: VerticalDivider())),
        const Expanded(flex: 35, child: SelectedModDisplay()),
      ],
    );
  }
}
