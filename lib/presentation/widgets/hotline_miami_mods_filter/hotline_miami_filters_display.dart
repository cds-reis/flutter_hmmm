import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';

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

    final rotation = useMemoized(
      () => Tween<double>(
        begin: 0,
        end: .5,
      ).animate(animationController),
      [animationController],
    );

    useEffect(() {
      if (isExpanded.value) {
        unawaited(animationController.forward());
      } else {
        unawaited(animationController.reverse());
      }

      return null;
    }, [isExpanded.value]);

    return Theme(
      data: Theme.of(context).copyWith(
        dividerTheme: const DividerThemeData(color: Colors.transparent),
      ),
      child: ExpansionTile(
        title: Row(
          spacing: 16,
          children: [
            Text('Filter', style: Theme.of(context).textTheme.titleMedium),
            _ExpandFilterIcon(rotation: rotation),
          ],
        ),
        expansionAnimationStyle: const AnimationStyle(
          duration: Duration(milliseconds: 100),
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

    useEffect(() {
      animationController.repeat(reverse: true).ignore();

      return null;
    }, const []);

    final animation = useAnimation(
      useMemoized(
        () => ColorTween(
          begin: Colors.lightBlue,
          end: Colors.blue.shade900,
        ).animate(animationController),
      ),
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
