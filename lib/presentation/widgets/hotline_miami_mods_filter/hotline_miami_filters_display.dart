// ignore_for_file: require_trailing_commas //

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';

import '../../hooks/use_effect_once.dart';
import '../favorite_mods/favorite_mods_filter.dart';
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
          spacing: 16,
          children: [
            Text('Filter', style: Theme.of(context).textTheme.titleMedium),
            _ExpandFilterIcon(rotation: rotation),
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
          Gap(4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(child: ModTypeFilter()),
              FavoriteModsFilterButton(),
            ],
          ),
          Gap(4),
          Divider(),
          Gap(4),
          AuthorOrNameFilter(),
          Gap(4),
        ],
      ),
    );
  }
}

class _ExpandFilterIcon extends HookWidget {
  const _ExpandFilterIcon({required this.rotation});

  final Animation<double> rotation;

  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController(
      duration: const Duration(seconds: 3),
    );

    useEffectOnce(() {
      animationController.repeat(reverse: true);
      return null;
    });

    final animation = useAnimation(
      ColorTween(
        begin: Colors.lightBlue,
        end: Colors.blue.shade900,
      ).animate(animationController),
    );

    return RotationTransition(
      turns: rotation,
      child: IgnorePointer(
        child: IconButton(
          onPressed: () {},
          icon: Icon(Icons.expand_more, color: animation),
          style: IconButton.styleFrom(
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: animation ?? Colors.transparent,
                width: 4,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
