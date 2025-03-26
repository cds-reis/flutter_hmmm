import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:leak_tracker/leak_tracker.dart';
import 'package:talker_riverpod_logger/talker_riverpod_logger.dart';

import 'app_theme.dart';
import 'eager_providers_initializer.dart';
import 'presentation/providers/global_providers.dart';
import 'presentation/widgets/project_configuration/project_configuration_display.dart';

void main() {
  runZonedGuarded(() {
    LeakTracking.start(
      config: LeakTrackingConfig(
        onLeaks: (leakSummary) => globalTalker.debug(leakSummary.toMessage()),
      ),
    );

    FlutterMemoryAllocations.instance.addListener(
      (event) => LeakTracking.dispatchObjectEvent(event.toMap()),
    );

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
        child: const EagerProvidersInitializer(child: MainApp()),
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
