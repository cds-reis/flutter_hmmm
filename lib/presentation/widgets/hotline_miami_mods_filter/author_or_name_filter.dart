import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/entities/hotline_miami_mod.dart';
import '../../providers/mods_filter_provider.dart';

typedef AuthorOrNameFilterValue = Either<ModAuthor, ModName>;

class AuthorOrNameFilter extends HookConsumerWidget {
  const AuthorOrNameFilter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groupValue = useState<AuthorOrNameFilterValue?>(null);
    final _ = ref.watch(modAuthorFilterProvider);
    final _ = ref.watch(modNameFilterProvider);
    final filterController = useTextEditingController();
    final textFieldFocusNode = useFocusNode();

    final fillColor = Theme.of(context).inputDecorationTheme.fillColor;
    final textFieldBackgroundColor =
        groupValue.value != null ? fillColor : fillColor?.withValues(alpha: .5);

    return Row(
      spacing: 16,
      children: [
        ChoiceChip(
          label: const Text('Name'),
          selected: groupValue.value?.isRight() ?? false,
          onSelected: (selected) {
            if (selected) {
              groupValue.value = const Right(ModName(''));
            } else {
              groupValue.value = null;
            }

            _textFieldRequestFocus(textFieldFocusNode);

            _clearFilter(filterController, ref);
          },
        ),
        ChoiceChip(
          label: const Text('Author'),
          selected: groupValue.value?.isLeft() ?? false,
          onSelected: (selected) {
            if (selected) {
              groupValue.value = const Left(ModAuthor(''));
            } else {
              groupValue.value = null;
            }

            _textFieldRequestFocus(textFieldFocusNode);

            _clearFilter(filterController, ref);
          },
        ),
        Expanded(
          child: TextField(
            focusNode: textFieldFocusNode,
            enabled: groupValue.value != null,
            controller: filterController,
            decoration: InputDecoration(fillColor: textFieldBackgroundColor),
            onChanged: (value) {
              switch (groupValue.value) {
                case Left():
                  ref
                      .read(modAuthorFilterProvider.notifier)
                      .update(ModAuthor(value));
                case Right():
                  ref
                      .read(modNameFilterProvider.notifier)
                      .update(ModName(value));
                case null:
              }
            },
          ),
        ),
      ],
    );
  }
}

void _textFieldRequestFocus(FocusNode textFieldFocusNode) {
  WidgetsBinding.instance.addPostFrameCallback(
    (_) => textFieldFocusNode.requestFocus(),
  );
}

void _clearFilter(TextEditingController filterController, WidgetRef ref) {
  filterController.clear();
  ref.read(modAuthorFilterProvider.notifier).clear();
  ref.read(modNameFilterProvider.notifier).clear();
}
