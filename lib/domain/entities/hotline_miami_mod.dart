import 'dart:io';
import 'dart:typed_data';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:path/path.dart' as p;

part 'hotline_miami_mod.mapper.dart';

@MappableClass(generateMethods: GenerateMethods.copy | GenerateMethods.equals)
class HotlineMiamiMod with HotlineMiamiModMappable {
  const HotlineMiamiMod({
    required this.id,
    required this.name,
    required this.author,
    required this.cover,
    required this.type,
    required this.directory,
    required this.additionalFilesDirectory,
    this.files = const IList.empty(),
    this.music,
  });

  final ModId id;
  final ModName name;
  final ModAuthor author;
  final ModDirectory directory;
  final ModType type;
  final IList<ModFile> files;
  final AdditionalFilesDirectory additionalFilesDirectory;
  final ModMusic? music;
  final ModCover? cover;

  @override
  String toString() {
    return 'HotlineMiamiMod(id: $id, name: $name, author: $author, type: $type, directory: $directory, additionalFilesDirectory: $additionalFilesDirectory, music: $music, files: $files)';
  }
}

extension type const ModId(String value) implements Object {}
extension type const ModName(String _value) implements String {}
extension type const ModCover(Uint8List _value) implements Uint8List {}
extension type const ModAuthor(String _value) implements String {}
extension type const ModDirectory(Directory _value) implements Directory {}
extension type const AdditionalFilesDirectory(Directory _value)
    implements Directory {}
extension type const ModMusic(File _value) implements File {
  String get name => p.basename(_value.path);
}
extension type const ModFile(File _value) implements File {
  String get name => p.basename(_value.path);
}

enum ModType { campaign, level }

class HotlineMiamiModParseFailure implements Exception {
  const HotlineMiamiModParseFailure(this.directory);

  final Directory directory;
}
