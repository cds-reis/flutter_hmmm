import 'package:flutter/material.dart';

import 'default_dialog.dart';

void showWrongFileTypeDialog(BuildContext context) {
  showDialog<void>(
    context: context,
    builder: (context) {
      return LayoutBuilder(
        builder: (context, constraints) {
          return DefaultDialog(
            child: SizedBox(
              width: constraints.maxWidth * 0.5,
              child: Column(
                spacing: 16,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Wrong file type',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    'The only file type supported is .zip, .patchwad and giving a folder with the .patchwad files inside.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    'Alternatively, you can open the Mod Files Folder and add all .patchwad files you want, or click on the Drop Files here zone.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
