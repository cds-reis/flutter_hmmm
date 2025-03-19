// ignore_for_file: protected_notifier_properties //, protected_notifier_properties
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/hotline_miami_mod.dart';
import 'global_providers.dart';

part 'mods_filter_provider.g.dart';

@riverpod
IList<HotlineMiamiMod> modsFilter(Ref ref, IList<HotlineMiamiMod> mods) {
  final authorFilter = ref.watch(modAuthorFilterProvider);
  final nameFilter = ref.watch(modNameFilterProvider);
  final typeFilter = ref.watch(modTypeFilterProvider);

  ref.watch(talkerProvider).info('Amount of mods recieved: ${mods.length}');

  final fiteredMods =
      mods
          .where((mod) => _authorFilterPredicate(mod, authorFilter))
          .where((mod) => _nameFilterPredicate(mod, nameFilter))
          .where((mod) => _typeFilterPredicate(mod, typeFilter))
          .toIList();

  ref
      .watch(talkerProvider)
      .info('Amount of mods filtered: ${fiteredMods.length}');

  return fiteredMods;
}

@riverpod
class ModNameFilter extends _$ModNameFilter {
  @override
  ModName build() => const ModName('');

  void update(ModName value) {
    ref.read(modAuthorFilterProvider.notifier).state = const ModAuthor('');
    state = value;
  }

  void clear() {
    state = const ModName('');
  }
}

@riverpod
class ModAuthorFilter extends _$ModAuthorFilter {
  @override
  ModAuthor build() => const ModAuthor('');

  void update(ModAuthor value) {
    ref.read(modNameFilterProvider.notifier).state = const ModName('');
    state = value;
  }

  void clear() {
    state = const ModAuthor('');
  }
}

@riverpod
class ModTypeFilter extends _$ModTypeFilter {
  @override
  ModType? build() => null;

  // ignore: use_setters_to_change_properties //
  void update(ModType? value) {
    state = value;
  }
}

bool _authorFilterPredicate(HotlineMiamiMod mod, ModAuthor authorFilter) {
  if (authorFilter.isEmpty) {
    return true;
  }

  return mod.author.toLowerCase().contains(authorFilter.toLowerCase());
}

bool _nameFilterPredicate(HotlineMiamiMod mod, ModName nameFilter) {
  if (nameFilter.isEmpty) {
    return true;
  }

  return mod.name.toUpperCase().contains(nameFilter.toUpperCase());
}

bool _typeFilterPredicate(HotlineMiamiMod mod, ModType? typeFilter) {
  if (typeFilter == null) {
    return true;
  }

  return mod.type == typeFilter;
}
