import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'presentation/widgets/project_configuration_display/project_configuration_display.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    const outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.zero,
      borderSide: BorderSide(width: 1.5),
    );

    const fillColor = Color.fromARGB(255, 8, 32, 10);
    const textShadow = BoxShadow(offset: Offset(2, 2));

    return MaterialApp(
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(),
        fontFamily: 'Retro Computer',
        dialogTheme: const DialogTheme(
          data: DialogThemeData(
            backgroundColor: fillColor,
            shape: RoundedRectangleBorder(),
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: outlineInputBorder,
          alignLabelWithHint: true,
          floatingLabelStyle: TextStyle(color: Colors.yellow),
          labelStyle: TextStyle(color: Colors.yellow),
          fillColor: fillColor,
          filled: true,
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder,
          hintStyle: TextStyle(color: Colors.white, shadows: [textShadow]),
          counterStyle: TextStyle(color: Colors.white, shadows: [textShadow]),
          prefixIconColor: Colors.white,
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white, shadows: [textShadow]),
          bodyMedium: TextStyle(color: Colors.white, shadows: [textShadow]),
          bodySmall: TextStyle(color: Colors.white, shadows: [textShadow]),
          titleLarge: TextStyle(color: Colors.white, shadows: [textShadow]),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            backgroundColor: const WidgetStateColor.fromMap({
              WidgetState.hovered: Colors.pinkAccent,
              WidgetState.any: fillColor,
            }),
            textStyle: const WidgetStatePropertyAll(
              TextStyle(fontFamily: 'Retro Computer', shadows: [textShadow]),
            ),
            foregroundColor: const WidgetStateColor.fromMap({
              WidgetState.hovered: Colors.white,
              WidgetState.any: Colors.yellow,
            }),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
            ),
            side: const WidgetStatePropertyAll(BorderSide()),
          ),
        ),
      ),
      title: 'Project Configuration',
      home: const Scaffold(body: Center(child: ProjectConfigurationDisplay())),
    );
  }
}
