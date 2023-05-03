import 'package:flutter/material.dart';

var lightCustomColorScheme = ColorScheme.fromSeed(
  seedColor: Colors.lightGreen,
  primary: Colors.green,
);

var lightCustomTheme = ThemeData(
  useMaterial3: true,
  colorScheme: lightCustomColorScheme,
  navigationBarTheme: NavigationBarThemeData(
    labelTextStyle: MaterialStateProperty.all(
      TextStyle(
        color: lightCustomColorScheme.onSurface,
        fontWeight: FontWeight.w500,
      ),
    ),
  ),
);

var darkCustomColorScheme = ColorScheme.fromSeed(
  seedColor: Colors.white,
  brightness: Brightness.dark,
  primary: Colors.grey,
  surface: const Color(0xff1B1A1D),
);

var darkCustomTheme = ThemeData(
  useMaterial3: true,
  colorScheme: darkCustomColorScheme,
  navigationBarTheme: NavigationBarThemeData(
    labelTextStyle: MaterialStateProperty.all(
      TextStyle(
        color: darkCustomColorScheme.onSurface,
        fontWeight: FontWeight.w500,
      ),
    ),
  ),
  canvasColor: const Color(0xff1B1A1D),
  scaffoldBackgroundColor: const Color(0xff1B1A1D),
);
