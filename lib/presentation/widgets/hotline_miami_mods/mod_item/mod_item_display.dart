import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../domain/entities/hotline_miami_mod.dart';
import '../../../providers/selected_mod_provider.dart';
import 'mod_item_display_image.dart';
import 'mod_item_display_text.dart';

class ModItemDisplay extends HookConsumerWidget {
  const ModItemDisplay({required this.mod, super.key});

  final HotlineMiamiMod mod;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isHovering = useState(false);
    final isSelected = ref.watch(selectedModProvider) == mod;
    final isActive = isHovering.value || isSelected;

    final borderColor = switch ((isSelected, isHovering.value)) {
      (true, _) => Colors.blue.shade300,
      (_, true) => Colors.blue.shade300,
      _ => Colors.transparent,
    };

    final shadowColor = switch ((isSelected, isHovering.value)) {
      (true, _) => Colors.black,
      (_, true) => Colors.black,
      _ => Colors.transparent,
    };

    return InkWell(
      onTap: () {
        ref.read(selectedModProvider.notifier).set(mod);
      },
      onHover: (value) => isHovering.value = value,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(width: 4, color: borderColor),
          boxShadow: [BoxShadow(color: shadowColor, spreadRadius: 6)],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            spacing: 16,
            children: [
              ModItemDisplayImage(mod: mod, opacity: isActive ? 1 : .4),
              ModItemDisplayText(mod: mod, active: isActive),
            ],
          ),
        ),
      ),
    );
  }
}
