part of 'show_pick_mod_files_dialog.dart';

class _ShowPickModFilesDialogWidget extends StatelessWidget {
  const _ShowPickModFilesDialogWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'How to get the files',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        for (final type in PickFilesType.values)
          ElevatedButton(
            onPressed: () => Navigator.pop(context, type),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(type.name, style: Theme.of(context).textTheme.bodyLarge),
                Text(
                  type.description,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
      ],
    );
  }
}
