import 'package:flutter/material.dart';

import '../hotline_miami_mods_filter/hotline_miami_filters_display.dart';
import '../utils/effects/noise_effect.dart';

class HotlineMiamiAppBar extends StatelessWidget {
  const HotlineMiamiAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return NoiseEffect(
      child: ColoredBox(
        color: Theme.of(context).colorScheme.surface,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16).copyWith(left: 16),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              spacing: 16,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hotline Miami Mods Manager',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const HotlineMiamiFiltersDisplay(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
