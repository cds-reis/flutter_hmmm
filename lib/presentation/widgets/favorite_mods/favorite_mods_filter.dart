// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member //

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorite_mods_filter.g.dart';

@riverpod
class FavoriteModsFilter extends _$FavoriteModsFilter {
  @override
  bool build() => false;
}

class FavoriteModsFilterButton extends ConsumerWidget {
  const FavoriteModsFilterButton({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(favoriteModsFilterProvider);

    return ChoiceChip(
      label: Text(
        'Favorites',
        style: TextStyle(color: selected ? null : Colors.pink),
      ),
      selected: selected,
      selectedColor: Colors.pink,
      shape: const RoundedRectangleBorder(side: BorderSide(color: Colors.pink)),
      onSelected: (value) {
        ref.read(favoriteModsFilterProvider.notifier).state = value;
      },
    );
  }
}
