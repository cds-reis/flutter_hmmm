import 'dart:io';

import 'package:archive/archive.dart';
import 'package:cross_file/cross_file.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';
import 'package:path/path.dart' as p;

import '../../domain/errors/selected_folder_not_found_exception.dart';

enum PickFilesType { zip, files, folder }

class SelectedFilesParsingService {
  const SelectedFilesParsingService();

  Option<PickFilesType> getPickFilesType(IList<XFile> files) {
    final isZip =
        Option.fromNullable(
          files.singleOrNull?.path,
        ).map(p.extension).filter((extension) => extension == '.zip').isSome();

    if (isZip) {
      return some(PickFilesType.zip);
    }

    final isFiles = files.every(
      (file) => p.extension(file.path) == '.patchwad',
    );

    if (isFiles) {
      return some(PickFilesType.files);
    }

    final isFolder =
        Option.fromNullable(files.singleOrNull?.path)
            .map(Directory.new)
            .filter((directory) => directory.existsSync())
            .isSome();

    if (isFolder) {
      return some(PickFilesType.folder);
    }
    return none();
  }

  Future<IList<XFile>> parseZip(XFile zip) async {
    final inputMemoryStream = InputMemoryStream(await zip.readAsBytes());

    final archive = ZipDecoder().decodeStream(inputMemoryStream);

    final patchwads = <XFile>[];

    for (final file in archive.files) {
      if (file.isFile && p.extension(file.name) == '.patchwad') {
        final fileName = p.basename(file.name);
        patchwads.add(XFile.fromData(file.content, path: fileName));
      }
    }

    return patchwads.toIList();
  }

  Future<IList<XFile>> parseFolder(String path) async {
    final folder = Directory(path);

    if (!folder.existsSync()) {
      throw SelectedFolderNotFoundException(folder);
    }

    final files = folder.listSync();

    return files
        .whereType<File>()
        .map((file) => file.path)
        .where((path) => p.extension(path) == '.patchwad')
        .map(XFile.new)
        .toIList();
  }
}
