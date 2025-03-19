import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../domain/entities/hotline_miami_mod.dart';
import '../../../../providers/global_providers.dart';
import '../../../../providers/selected_mod_provider.dart';
import '../../../hotline_miami_mods/hotline_miami_mods_display.dart';

class RefreshModsButton extends ConsumerWidget {
  const RefreshModsButton({required this.mod, super.key});

  final HotlineMiamiMod mod;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton.icon(
      onPressed: () async {
        final mods = await ref.refresh(hotlineMiamiModsProvider.future);
        final selectedMod = mods.firstWhereOrNull(
          (element) => element.id == mod.id,
        );

        if (selectedMod == null) {
          ref
              .read(talkerProvider)
              .warning(
                'Mods file folder opened but no mod is selected. The user may have removed the mod from the mods list.',
              );
          return;
        }

        ref.read(selectedModProvider.notifier).set(selectedMod);
      },
      label: const Text('Refresh'),
      icon: const Icon(Icons.refresh),
    );
  }
}
