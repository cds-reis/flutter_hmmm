import 'package:flutter/material.dart';

import '../../../../../domain/entities/hotline_miami_mod.dart';

class ModFileItemDisplay extends StatelessWidget {
  const ModFileItemDisplay({required this.file, super.key});

  final ModFile file;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            ColoredBox(
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Text(file.name),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
