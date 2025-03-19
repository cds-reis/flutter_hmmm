class ModsFolderNotFoundException implements Exception {
  const ModsFolderNotFoundException({required this.path});

  final String path;

  @override
  String toString() {
    return 'Mods folder not found: $path';
  }
}
