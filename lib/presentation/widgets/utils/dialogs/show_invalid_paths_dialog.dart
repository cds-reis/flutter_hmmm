import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'default_dialog.dart';

void showInvalidPathsDialog(BuildContext context, List<String> invalidPaths) {
  showDialog<void>(
    context: context,
    builder: (context) {
      return DefaultDialog(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Invalid Paths',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const Gap(16),
            for (final path in invalidPaths)
              Text(
                'The $path is invalid. Please check the path and try again.',
              ),
          ],
        ),
      );
    },
  );
}
