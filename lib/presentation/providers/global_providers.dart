import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:talker/talker.dart';

part 'global_providers.g.dart';

@riverpod
Talker talker(Ref ref) {
  return globalTalker;
}

final globalTalker = Talker();
