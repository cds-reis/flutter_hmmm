import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../providers/selected_mod_provider.dart';
import '../current_mod/current_mod_display.dart';
import '../favorite_mods/favorite_mod_button.dart';
import '../utils/animations/custom_animated_gradient.dart';
import '../utils/effects/noise_effect.dart';
import 'additional_mods/additional_mods_display.dart';
import 'selected_mod_display_text.dart';
import 'selected_mod_image.dart';
import 'use_this_mod_button.dart';

class SelectedModDisplay extends ConsumerWidget {
  const SelectedModDisplay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isModSelected = ref.watch(
      selectedModProvider.select((value) => value != null),
    );

    if (!isModSelected) {
      return const NoiseEffect(
        child: SizedBox.expand(
          child: Padding(
            padding: EdgeInsets.all(32),
            child: CurrentModDisplay(),
          ),
        ),
      );
    }

    return NoiseEffect(
      child: SizedBox.expand(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(32),
              sliver: SliverList.list(
                children: [
                  const CurrentModDisplay(),
                  const Gap(16),
                  CustomAnimatedGradient(
                    gradientSteps: const [
                      (begin: Colors.indigo, end: Colors.purple),
                      (
                        begin: Colors.indigoAccent,
                        end: Colors.deepPurpleAccent,
                      ),
                      (begin: Colors.cyan, end: Colors.pink),
                    ],

                    duration: const Duration(seconds: 6),
                    child: NoiseEffect(
                      child: Padding(
                        padding: const EdgeInsets.all(32),
                        child: Center(
                          child: Consumer(
                            builder: (context, ref, child) {
                              final selectedMod =
                                  ref.watch(selectedModProvider)!;

                              return Column(
                                spacing: 40,
                                children: [
                                  SelectedModImage(mod: selectedMod),
                                  SelectedModDisplayText(
                                    selectedMod: selectedMod,
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Gap(16),
                  Consumer(
                    builder: (context, ref, child) {
                      final selectedMod = ref.watch(selectedModProvider)!;

                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          UseThisModButton(mod: selectedMod),
                          FavoriteModButton(mod: selectedMod),
                        ],
                      );
                    },
                  ),
                  const Gap(16),
                  Consumer(
                    builder: (_, ref, _) {
                      return AdditionalModsDisplay(
                        mod: ref.watch(selectedModProvider)!,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
