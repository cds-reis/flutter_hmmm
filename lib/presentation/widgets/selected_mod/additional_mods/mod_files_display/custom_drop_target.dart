import 'package:cross_file/cross_file.dart';
import 'package:desktop_drop/desktop_drop.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../data/services/selected_files_parsing_service.dart';
import '../../../../providers/selected_mod_provider.dart';
import '../../../../providers/services_providers.dart';
import '../../../utils/animations/custom_animated_gradient.dart';
import '../../../utils/dialogs/show_wrong_file_type_dialog.dart';
import 'mod_files_drop_target.dart';

class CustomDropTarget extends HookConsumerWidget {
  const CustomDropTarget({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomAnimatedGradient(
      gradientSteps: [
        (begin: Colors.greenAccent, end: Colors.green.shade600),
        (begin: Colors.blue.shade400, end: Colors.indigo),
      ],
      duration: const Duration(seconds: 5),
      child: HookConsumer(
        child: child,
        builder: (context, ref, child) {
          final isHovering = useState(false);
          final controller = useAnimationController(
            duration: const Duration(milliseconds: 1500),
          );

          useEffect(() {
            if (isHovering.value) {
              controller.repeat(reverse: true);
            } else {
              controller.reset();
            }
            return null;
            // ignore: require_trailing_commas //
          }, [isHovering.value]);

          final animation = Tween<double>(begin: 1, end: 1.2).animate(
            CurvedAnimation(parent: controller, curve: Curves.easeInOut),
          );

          return DropTarget(
            onDragEntered: (_) => isHovering.value = true,
            onDragExited: (_) => isHovering.value = false,
            onDragDone: (details) async {
              final service = ref.read(selectedFilesParsingServiceProvider);
              final addedFiles = details.files.cast<XFile>().toIList();

              final pickFilesType = service.getPickFilesType(addedFiles);

              final files = switch (pickFilesType) {
                Some(value: PickFilesType.zip) => await service.parseZip(
                  addedFiles.first,
                ),
                Some(value: PickFilesType.files) => addedFiles,
                Some(value: PickFilesType.folder) => await service.parseFolder(
                  addedFiles.first.path,
                ),
                None() => null,
              };

              if (files == null) {
                if (context.mounted) {
                  showWrongFileTypeDialog(context);
                }
                return;
              }

              ref.read(
                addModFilesProvider(ref.read(selectedModProvider)!, files),
              );
            },
            child: _DropTargetDecoration(
              child: ScaleTransition(scale: animation, child: child),
            ),
          );
        },
      ),
    );
  }
}

class _DropTargetDecoration extends StatelessWidget {
  const _DropTargetDecoration({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: DecoratedBox(
        decoration: BoxDecoration(border: Border.all(width: 4)),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: DecoratedBox(
            decoration: BoxDecoration(border: Border.all(width: 4)),
            child: SizedBox(
              width: double.infinity,
              height: 200,
              child: Center(child: child),
            ),
          ),
        ),
      ),
    );
  }
}
