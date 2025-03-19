import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:talker_riverpod_logger/talker_riverpod_logger.dart';

import 'app_theme.dart';
import 'presentation/providers/global_providers.dart';
import 'presentation/widgets/project_configuration/project_configuration_display.dart';

void main() {
  runZonedGuarded(() {
    runApp(
      ProviderScope(
        observers: [
          TalkerRiverpodObserver(
            talker: globalTalker,
            settings: const TalkerRiverpodLoggerSettings(
              printProviderDisposed: true,
            ),
          ),
        ],
        child: const MainApp(),
      ),
    );
    // ignore: require_trailing_commas //
  }, globalTalker.error);
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: buildAppTheme(),
      home: const Scaffold(body: Center(child: ProjectConfigurationDisplay())),
    );
  }
}
