import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/entities/hotline_miami_mod.dart';
import '../../providers/current_mod_provider.dart';

class UseThisModButton extends ConsumerWidget {
  const UseThisModButton({required this.mod, super.key});

  final HotlineMiamiMod mod;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
      onPressed: switch (ref.watch(currentModProvider)) {
        AsyncLoading() => null,
        _ => () => _onUseThisModPressed(ref),
      },
      child: const Text('Use this mod'),
    );
  }

  void _onUseThisModPressed(WidgetRef ref) {
    ref.read(currentModProvider.notifier).setCurrentMod(mod);
  }
}
