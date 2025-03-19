import 'package:flutter/material.dart';

class DefaultMusicErrorDisplay extends StatelessWidget {
  const DefaultMusicErrorDisplay({
    required this.error,
    required this.stackTrace,
    super.key,
  });

  final Object error;
  final StackTrace stackTrace;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Something wrong happened when loading the default music.'),
        Text(error.toString()),
        const Text('Please report this to the GitHub repository.'),
      ],
    );
  }
}
