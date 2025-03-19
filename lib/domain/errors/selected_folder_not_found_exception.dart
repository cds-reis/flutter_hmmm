import 'dart:io';

class SelectedFolderNotFoundException implements Exception {
  const SelectedFolderNotFoundException(this.directory);

  final Directory directory;

  @override
  String toString() {
    return 'Selected folder not found: $directory';
  }
}
