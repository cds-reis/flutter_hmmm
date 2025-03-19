import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/services/selected_files_parsing_service.dart';

part 'services_providers.g.dart';

@riverpod
SelectedFilesParsingService selectedFilesParsingService(Ref ref) {
  return const SelectedFilesParsingService();
}
