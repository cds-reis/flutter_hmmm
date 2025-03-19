import 'package:choice/choice.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/entities/hotline_miami_mod.dart';
import '../../providers/mods_filter_provider.dart';

class ModTypeFilter extends ConsumerWidget {
  const ModTypeFilter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final modTypeState = ref.watch(modTypeFilterProvider);

    return SizedBox(
      width: double.infinity,
      child: InlineChoice<ModType>.single(
        itemCount: ModType.values.length,
        onChanged: (modType) {
          ref.read(modTypeFilterProvider.notifier).update(modType);
        },
        value: modTypeState,
        clearable: true,
        itemBuilder: (state, index) {
          final modType = ModType.values[index];
          return ChoiceChip(
            shape: const RoundedRectangleBorder(),
            avatarBorder: const RoundedRectangleBorder(),
            label: Text(modType.name),
            selected: state.selected(modType),
            onSelected: (selected) {
              state.select(modType);
            },
          );
        },
      ),
    );
  }
}
