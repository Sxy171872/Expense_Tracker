import 'package:flutter/material.dart';

import './expenses.dart';

final kcolorScheme =
    ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 151, 37, 217));

final kDarkcolorScheme = ColorScheme.fromSeed(
    seedColor: Color.fromARGB(255, 72, 5, 111), brightness: Brightness.dark);

void main() {
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
          colorScheme: kDarkcolorScheme,
          useMaterial3: true,
          appBarTheme: AppBarTheme().copyWith(
              backgroundColor: kDarkcolorScheme.primaryContainer,
              foregroundColor: kDarkcolorScheme.onPrimaryContainer),
          cardTheme:
              CardTheme().copyWith(color: kDarkcolorScheme.secondaryContainer),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  backgroundColor: kDarkcolorScheme.primaryContainer))),
      theme: ThemeData().copyWith(
          useMaterial3: true,
          colorScheme: kcolorScheme,
          appBarTheme: AppBarTheme().copyWith(
              backgroundColor: kcolorScheme.onPrimaryContainer,
              foregroundColor: kcolorScheme.primaryContainer),
          cardTheme:
              CardTheme().copyWith(color: kcolorScheme.secondaryContainer),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  backgroundColor: kcolorScheme.primaryContainer)),
          textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                  color: kcolorScheme.onSecondaryContainer))),
      home: Expenses(),
      themeMode: ThemeMode.light,
    ),
  );
}
