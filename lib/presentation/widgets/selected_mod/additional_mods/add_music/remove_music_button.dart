import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../domain/entities/hotline_miami_mod.dart';
import '../../../../hooks/use_effect_once.dart';
import '../../../../providers/repositories_providers.dart';
import '../../../../providers/selected_mod_provider.dart';
import '../../../hotline_miami_mods/hotline_miami_mods_display.dart';

part 'remove_music_button.g.dart';

@riverpod
Future<void> removeMusic(Ref ref, HotlineMiamiMod mod) async {
  final repository = ref.watch(additionalFilesRepositoryProvider);

  await repository.removeMusic(mod.id);

  final mod2 = mod.copyWith(music: null);
  ref.watch(selectedModProvider.notifier).set(mod2);
  ref.watch(hotlineMiamiModsProvider.notifier).updateMod(mod2);
}

class RemoveMusicButton extends HookConsumerWidget {
  const RemoveMusicButton({required this.mod, super.key});

  final HotlineMiamiMod mod;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animationController = useAnimationController(
      duration: const Duration(seconds: 2),
    );

    useEffectOnce(() {
      animationController.repeat(reverse: true);
      return null;
    });

    final animation = useAnimation(
      ColorTween(
        begin: Colors.red.shade400,
        end: Colors.red.shade900,
      ).animate(animationController),
    );

    return IconButton(
      onPressed: () {
        ref.read(removeMusicProvider(mod));
      },
      color: animation,
      icon: const Icon(Icons.delete_forever_sharp),
      style: IconButton.styleFrom(
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: animation ?? Colors.transparent, width: 4),
        ),
      ),
    );
  }
}
