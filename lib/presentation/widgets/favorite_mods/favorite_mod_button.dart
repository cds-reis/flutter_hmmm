import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/entities/hotline_miami_mod.dart';
import 'favorite_mods_provider.dart';

class FavoriteModButton extends ConsumerWidget {
  const FavoriteModButton({required this.mod, super.key});

  final HotlineMiamiMod mod;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFavorite = ref.watch(
      favoriteModsProvider.select((value) => value.contains(mod.id)),
    );

    return IconButton(
      onPressed: () {
        if (isFavorite) {
          ref.read(favoriteModsProvider.notifier).removeMod(mod.id);
        } else {
          ref.read(favoriteModsProvider.notifier).addMod(mod.id);
        }
      },
      color: Colors.pink,
      style: Theme.of(context).iconButtonTheme.style?.copyWith(
        shape: const WidgetStatePropertyAll(
          RoundedRectangleBorder(
            side: BorderSide(color: Colors.pink, width: 4),
          ),
        ),
      ),
      icon:
          isFavorite
              ? const Icon(Icons.favorite)
              : const Icon(Icons.favorite_outline_sharp),
    );
  }
}
