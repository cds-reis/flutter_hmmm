import 'package:flutter/material.dart';

import '../../utils/animations/animated_color_text.dart';

class HotlineMiamiTitle extends StatelessWidget {
  const HotlineMiamiTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedColorText(
      style: Theme.of(context).textTheme.titleLarge,
      curve: Curves.easeInOut,
      colors: const [Colors.cyan, Colors.purpleAccent],
      text: 'Hotline Miami Mods Manager',
    );
  }
}
