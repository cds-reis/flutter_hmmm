import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/hotline_miami_mod.dart';
import 'global_providers.dart';

part 'selected_mod_provider.g.dart';

@riverpod
class SelectedMod extends _$SelectedMod {
  @override
  HotlineMiamiMod? build() => null;

  void set(HotlineMiamiMod mod) {
    ref.read(talkerProvider).verbose('Selected mod: ${mod.name}');
    state = mod;
  }

  void clear() {
    if (state == null) {
      ref
          .read(talkerProvider)
          .warning('Cleared selected mod but no mod was selected');
      return;
    }

    ref.read(talkerProvider).verbose('Cleared selected mod');
    state = null;
  }
}
