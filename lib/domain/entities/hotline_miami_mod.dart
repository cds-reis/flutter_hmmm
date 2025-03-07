import 'dart:io';

import 'package:collection/collection.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:path/path.dart' as p;

part 'hotline_miami_mod.mapper.dart';

@MappableClass()
class HotlineMiamiMod with HotlineMiamiModMappable {
  const HotlineMiamiMod({
    required this.name,
    required this.path,
    required this.music,
    required this.additionalFiles,
  });

  final HotlineMiamiModName name;
  final HotlineMiamiModPath path;
  final CustomModMusic? music;
  final List<AdditionalModFile> additionalFiles;

  static Either<HotlineMiamiModParseFailure, HotlineMiamiMod> fromDirectory(
    Directory directory,
  ) {
    final name = HotlineMiamiModName(directory.path.split('/').last);
    final path = HotlineMiamiModPath(directory);
    final music = _getMusic(directory);
    final additionalFiles = _getAdditionalFiles(directory);

    return Right(
      HotlineMiamiMod(
        name: name,
        path: path,
        music: music,
        additionalFiles: additionalFiles,
      ),
    );
  }

  static List<AdditionalModFile> _getAdditionalFiles(Directory directory) {
    final additionalFilesPath = Directory(
      p.join(directory.path, 'additional_mods'),
    )..createSync();

    final additionalFiles =
        additionalFilesPath
            .listSync()
            .where((element) => FileSystemEntity.isFileSync(element.path))
            .where((element) => p.extension(element.path) != '.patchwad')
            .map((file) => file as File)
            .map(AdditionalModFile.new)
            .toList();
    return additionalFiles;
  }

  static CustomModMusic? _getMusic(Directory directory) {
    final musicPath = Directory(p.join(directory.path, 'music'))..createSync();
    final musicFile = musicPath
        .listSync()
        .where((element) => FileSystemEntity.isFileSync(element.path))
        .map((file) => file as File)
        .firstWhereOrNull((file) => p.extension(file.path) == '.wad');

    final music = musicFile != null ? CustomModMusic(musicFile) : null;
    return music;
  }
}

extension type const HotlineMiamiModName(String name) implements String {}

extension type const HotlineMiamiModPath(Directory path) {}

extension type const CustomModMusic(File music) {}

extension type const AdditionalModFile(File file) {}

class HotlineMiamiModParseFailure implements Exception {
  const HotlineMiamiModParseFailure(this.directory);

  final Directory directory;
}
