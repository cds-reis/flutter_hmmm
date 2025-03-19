import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../domain/entities/hotline_miami_mod.dart';
import '../mod_item/mod_item_display.dart';

class ModsListView extends StatelessWidget {
  const ModsListView({required this.mods, super.key});

  final IList<HotlineMiamiMod> mods;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: mods.length,
      separatorBuilder: (_, _) => const Gap(16),
      itemBuilder: (_, index) {
        return ModItemDisplay(mod: mods[index]);
      },
    );
  }
}
