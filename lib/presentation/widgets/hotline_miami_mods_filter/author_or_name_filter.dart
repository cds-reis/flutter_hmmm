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
    final filterController = useTextEditingController();

    return Row(
      children: [
        IconButton(
          onPressed: () {
            filterController.clear();
            groupValue.value = null;
            ref.read(modAuthorFilterProvider.notifier).clear();
            ref.read(modNameFilterProvider.notifier).clear();
          },
          icon: const Icon(Icons.clear_sharp),
        ),
        IntrinsicWidth(
          child: RadioListTile<AuthorOrNameFilterValue?>(
            value: const Right(ModName('')),
            groupValue: groupValue.value,
            onChanged: (_) {
              filterController.clear();
              groupValue.value = const Right(ModName(''));
              ref.read(modAuthorFilterProvider.notifier).clear();
            },
            title: Text('Name', style: Theme.of(context).textTheme.bodyMedium),
          ),
        ),
        IntrinsicWidth(
          child: RadioListTile<AuthorOrNameFilterValue?>(
            value: const Left(ModAuthor('')),
            groupValue: groupValue.value,
            onChanged: (_) {
              filterController.clear();
              groupValue.value = const Left(ModAuthor(''));
              ref.read(modNameFilterProvider.notifier).clear();
            },
            title: Text(
              'Author',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ),
        Expanded(
          child: TextField(
            enabled: groupValue.value != null,
            controller: filterController,
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
