import 'package:flutter/material.dart';

class ProjectConfigurationErrorDisplay extends StatelessWidget {
  const ProjectConfigurationErrorDisplay({
    required this.error,
    required this.stackTrace,
    super.key,
  });

  final Object error;
  final StackTrace stackTrace;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Something wrong happened when loading the project configuration.',
        ),
        Text(error.toString()),
        const Text('Please report this to the GitHub repository.'),
      ],
    );
  }
}
