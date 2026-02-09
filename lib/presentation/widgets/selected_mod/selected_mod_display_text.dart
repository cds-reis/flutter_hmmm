import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';

import '../../../domain/entities/hotline_miami_mod.dart';

class SelectedModDisplayText extends HookWidget {
  const SelectedModDisplayText({required this.selectedMod, super.key});

  final HotlineMiamiMod selectedMod;

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(
      duration: const Duration(seconds: 2),
    );

    useEffect(() {
      controller.repeat(reverse: true).ignore();

      return null;
    }, const []);

    final animation = useAnimation(
      useMemoized(
        () => ColorTween(
          begin: Colors.pink,
          end: Colors.pink.shade200,
        ).animate(controller),
        [controller],
      ),
    );

    return Column(
      spacing: 16,
      children: [
        ColoredBox(
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: Text(
              selectedMod.name,
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(color: animation),
            ),
          ),
        ),
        const Gap(16),
        ColoredBox(
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
            child: Text(
              'by ${selectedMod.author}',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: animation),
            ),
          ),
        ),
      ],
    );
  }
}
