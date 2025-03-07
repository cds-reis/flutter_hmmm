import 'dart:io';

import 'package:fpdart/fpdart.dart';

typedef ParseExistingDirectoryResult =
    Either<DirectoryDoesNotExistException, ExistingDirectory>;

extension type const ExistingDirectory._(Directory _) implements Directory {
  static ParseExistingDirectoryResult parse(String path) =>
      parseExistingDirectory(path);
}

ParseExistingDirectoryResult parseExistingDirectory(String path) {
  if (FileSystemEntity.isDirectorySync(path)) {
    return Right(ExistingDirectory._(Directory(path)));
  } else {
    return Left(DirectoryDoesNotExistException(path));
  }
}

class DirectoryDoesNotExistException implements Exception {
  const DirectoryDoesNotExistException(this.path);

  final String path;
}
