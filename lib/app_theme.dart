import 'package:flutter/material.dart';

ThemeData buildAppTheme() {
  const outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.zero,
    borderSide: BorderSide(width: 1.5),
  );

  const fillColor = Color.fromARGB(255, 8, 32, 10);
  const textShadow = BoxShadow(offset: Offset(2, 2));

  return ThemeData(
    colorScheme: const ColorScheme.dark(),
    fontFamily: 'Retro Computer',
    dialogTheme: const DialogTheme(
      data: DialogThemeData(
        backgroundColor: fillColor,
        shape: RoundedRectangleBorder(),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: outlineInputBorder,
      alignLabelWithHint: true,
      floatingLabelStyle: const TextStyle(color: Colors.yellow),
      labelStyle: const TextStyle(color: Colors.yellow),
      fillColor: fillColor,
      filled: true,
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      disabledBorder: outlineInputBorder.copyWith(
        borderSide: BorderSide(
          width: 1.5,
          color: Colors.black.withAlpha(255 ~/ 2),
        ),
      ),
      hintStyle: const TextStyle(color: Colors.white, shadows: [textShadow]),
      counterStyle: const TextStyle(color: Colors.white, shadows: [textShadow]),
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
          WidgetState.disabled: Colors.grey,
          WidgetState.any: Colors.yellow,
        }),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        ),
        side: const WidgetStatePropertyAll(BorderSide()),
        iconColor: const WidgetStateColor.fromMap({
          WidgetState.hovered: Colors.white,
          WidgetState.any: Colors.yellow,
        }),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: const WidgetStateColor.fromMap({
          WidgetState.hovered: Colors.pinkAccent,
          WidgetState.any: fillColor,
        }),
        padding: const WidgetStatePropertyAll(EdgeInsets.all(16)),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        ),
      ),
    ),
  );
}
