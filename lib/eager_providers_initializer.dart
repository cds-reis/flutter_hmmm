import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'presentation/widgets/favorite_mods/favorite_mods_provider.dart';

class EagerProvidersInitializer extends ConsumerWidget {
  const EagerProvidersInitializer({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(favoriteModsProvider);
    return child;
  }
}
