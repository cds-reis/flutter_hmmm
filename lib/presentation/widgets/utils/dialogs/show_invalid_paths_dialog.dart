import 'package:flutter/material.dart';

import 'default_dialog.dart';

Future<void> showInvalidPathsDialog(
  BuildContext context,
  List<String> invalidPaths,
) {
  return showDialog<void>(
    context: context,
    builder: (context) {
      return DefaultDialog(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: [
            Text(
              'Invalid Paths',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
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
