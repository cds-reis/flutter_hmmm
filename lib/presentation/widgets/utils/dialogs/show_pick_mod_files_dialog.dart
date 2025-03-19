import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';

import '../../../../data/services/selected_files_parsing_service.dart';
import 'default_dialog.dart';

part 'show_pick_mod_files_dialog_widget.dart';

extension on PickFilesType {
  String get description => switch (this) {
    PickFilesType.zip =>
      'Give a zip file and all .patchwad files inside will be extracted and added.',
    PickFilesType.files => 'Select all .patchwad files you want to add.',
    PickFilesType.folder =>
      'Give a folder and all .patchwad files inside will be added.',
  };
}

Future<IList<XFile>?> showPickModFilesDialog(
  BuildContext context,
  SelectedFilesParsingService service,
) async {
  final type = await showDialog<PickFilesType>(
    context: context,
    builder: (context) {
      return const DefaultDialog(child: _ShowPickModFilesDialogWidget());
    },
  );

  if (type == null) {
    return null;
  }

  switch (type) {
    case PickFilesType.zip:
      final zip = await openFile(
        acceptedTypeGroups: [
          const XTypeGroup(label: 'Zip files', extensions: ['zip']),
        ],
      );

      if (zip == null) {
        return null;
      }

      return service.parseZip(zip);

    case PickFilesType.files:
      final files = await openFiles(
        acceptedTypeGroups: [
          const XTypeGroup(label: 'Patchwad files', extensions: ['patchwad']),
        ],
      );

      if (files.isEmpty) {
        return null;
      }

      return files.toIList();

    case PickFilesType.folder:
      final folder = await getDirectoryPath();

      if (folder == null) {
        return null;
      }

      return service.parseFolder(folder);
  }
}
