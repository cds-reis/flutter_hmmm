import 'package:animate_gradient/animate_gradient.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../domain/entities/hotline_miami_mod.dart';
import '../../../providers/mods_filter_provider.dart';
import '../hotline_miami_app_bar.dart';
import 'mods_grid_view.dart';
import 'mods_list_view.dart';

class ModsScrollView extends ConsumerWidget {
  const ModsScrollView({required this.mods, super.key});

  final IList<HotlineMiamiMod> mods;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredMods = ref.watch(modsFilterProvider(mods));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HotlineMiamiAppBar(),
        Expanded(
          child: AnimateGradient(
            primaryColors: const [Colors.purple, Colors.deepPurple],
            secondaryColors: const [Colors.deepPurple, Colors.purple],
            child: LayoutBuilder(
              builder: (context, constraints) {
                return switch (constraints.maxWidth) {
                  >= 900 => ModsGridView(mods: filteredMods),
                  _ => ModsListView(mods: filteredMods),
                };
              },
            ),
          ),
        ),
      ],
    );
  }
}
