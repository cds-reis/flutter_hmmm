import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../utils/effects/noise_effect.dart';
import 'author_or_name_filter.dart';
import 'mod_type_filter.dart';

class ModsFilterDisplay extends StatelessWidget {
  const ModsFilterDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return NoiseEffect(
      child: ColoredBox(
        color: Theme.of(context).colorScheme.surface,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8).copyWith(left: 16),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hotline Miami Mods Manager',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const Gap(24),
                Text(
                  'Filter by',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const AuthorOrNameFilter(),
                const ModTypeFilter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
