// ignore_for_file: require_trailing_commas //

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';

import 'author_or_name_filter.dart';
import 'mod_type_filter.dart';

class HotlineMiamiFiltersDisplay extends HookWidget {
  const HotlineMiamiFiltersDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    final isExpanded = useState(false);
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 100),
    );

    final rotation = Tween<double>(
      begin: 0,
      end: .5,
    ).animate(animationController);

    useEffect(() {
      if (isExpanded.value) {
        animationController.forward();
      } else {
        animationController.reverse();
      }

      return null;
    }, [isExpanded.value]);

    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        title: Row(
          spacing: 8,
          children: [
            Text('Filter', style: Theme.of(context).textTheme.titleMedium),
            RotationTransition(
              turns: rotation,
              child: const Icon(Icons.expand_more),
            ),
          ],
        ),
        expansionAnimationStyle: AnimationStyle(
          duration: const Duration(milliseconds: 100),
        ),
        maintainState: true,
        showTrailingIcon: false,
        onExpansionChanged: (value) => isExpanded.value = value,
        children: const [
          Divider(),
          AuthorOrNameFilter(),
          Divider(),
          Gap(4),
          ModTypeFilter(),
          Gap(4),
        ],
      ),
    );
  }
}
