import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../domain/entities/hotline_miami_mod.dart';
import '../../../../../../presentation/widgets/utils/dialogs/show_pick_mod_files_dialog.dart';
import '../../../../providers/repositories_providers.dart';
import '../../../../providers/selected_mod_provider.dart';
import '../../../../providers/services_providers.dart';
import '../../../hotline_miami_mods/hotline_miami_mods_display.dart';
import 'custom_drop_target.dart';

part 'mod_files_drop_target.g.dart';

@riverpod
Future<void> addModFiles(
  Ref ref,
  HotlineMiamiMod mod,
  IList<XFile> files,
) async {
  final repository = ref.read(additionalFilesRepositoryProvider);

  final newMods = await repository.setModFiles(mod.id, files);

  final newMod = mod.copyWith(files: mod.files.addAll(newMods));

  ref.watch(selectedModProvider.notifier).set(newMod);
  ref.watch(hotlineMiamiModsProvider.notifier).updateMod(newMod);
}

class ModFilesDropTarget extends ConsumerWidget {
  const ModFilesDropTarget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () async {
        final files = await showPickModFilesDialog(
          context,
          ref.read(selectedFilesParsingServiceProvider),
        );

        if (files == null || files.isEmpty) {
          return;
        }

        ref.read(addModFilesProvider(ref.read(selectedModProvider)!, files));
      },
      child: const CustomDropTarget(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ColoredBox(
              color: Colors.black,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Text('Drop files here'),
              ),
            ),
            ColoredBox(
              color: Colors.black,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Icon(Icons.file_upload_outlined),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
