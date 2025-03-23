import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/entities/hotline_miami_mod.dart';
import '../../providers/repositories_providers.dart';

part 'favorite_mods_provider.g.dart';

const _favoriteModsKey = 'favoriteMods';

@riverpod
class FavoriteMods extends _$FavoriteMods {
  @override
  ISet<ModId> build() {
    final sharedPrefs = ref.watch(sharedPreferencesProvider);

    sharedPrefs.getStringList(_favoriteModsKey).then((favoriteMods) {
      if (favoriteMods == null) {
        return;
      }

      state = favoriteMods.map(ModId.new).toISet();
    });

    return const ISet.empty();
  }

  Future<void> addMod(ModId modId) {
    state = state.add(modId);
    final sharedPrefs = ref.watch(sharedPreferencesProvider);
    return sharedPrefs.setStringList(
      _favoriteModsKey,
      state.map((e) => e.value).toList(),
    );
  }

  Future<void> removeMod(ModId modId) {
    state = state.remove(modId);
    final sharedPrefs = ref.watch(sharedPreferencesProvider);
    return sharedPrefs.setStringList(
      _favoriteModsKey,
      state.map((e) => e.value).toList(),
    );
  }
}
