import 'package:flutter/material.dart';

import '../../hotline_miami_mods_filter/hotline_miami_filters_display.dart';
import 'hotline_miami_title.dart';
import 'open_configs_button.dart';
import 'run_game_button.dart';

class HotlineMiamiAppBar extends StatelessWidget {
  const HotlineMiamiAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).colorScheme.surface,
      child: const Padding(
        padding: EdgeInsets.all(16),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            spacing: 16,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                spacing: 16,
                children: [
                  Expanded(child: HotlineMiamiTitle()),
                  RunGameButton(),
                  OpenConfigsButton(),
                ],
              ),
              HotlineMiamiFiltersDisplay(),
            ],
          ),
        ),
      ),
    );
  }
}
