import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../domain/entities/hotline_miami_mod.dart';
import '../../../../providers/global_providers.dart';

class ModFilesFolderButton extends ConsumerWidget {
  const ModFilesFolderButton({required this.mod, super.key});

  final HotlineMiamiMod mod;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
      onPressed: () async {
        final directory = mod.additionalFilesDirectory;

        if (!directory.existsSync()) {
          ref
              .read(talkerProvider)
              .warning('Mod files directory not found: $directory');
          return;
        }

        final modFilesPath = directory.path;

        final _ = await Process.run('explorer', [
          modFilesPath,
          // ignore: require_trailing_commas //
        ], workingDirectory: modFilesPath);
      },
      child: const Text('Mod files folder'),
    );
  }
}
