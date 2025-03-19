import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../domain/entities/hotline_miami_mod.dart';
import '../mod_item/mod_item_display.dart';

class ModsGridView extends StatelessWidget {
  const ModsGridView({required this.mods, super.key});

  final IList<HotlineMiamiMod> mods;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: (mods.length / 2).ceil(),
      separatorBuilder: (_, __) => const Gap(16),
      itemBuilder: (_, index) {
        final realIndex = index * 2;
        return Row(
          spacing: 24,
          children: [
            Flexible(flex: 5, child: ModItemDisplay(mod: mods[realIndex])),
            if (realIndex + 1 < mods.length)
              Flexible(flex: 5, child: ModItemDisplay(mod: mods[realIndex + 1]))
            else
              const Flexible(flex: 5, child: SizedBox()),
          ],
        );
      },
    );
  }
}
