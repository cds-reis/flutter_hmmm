import 'dart:io';

import 'package:dart_mappable/dart_mappable.dart';

import '../use_cases/parse_existing_directory.dart';

class ExistingDirectoryHook extends MappingHook {
  const ExistingDirectoryHook();

  @override
  Object? beforeDecode(Object? value) {
    if (value is String) {
      return ExistingDirectory.parse(value).getOrElse((l) => throw l);
    }

    return null;
  }

  @override
  Object? beforeEncode(Object? value) {
    if (value case Directory(:final path)) {
      return path;
    }

    return null;
  }
}
