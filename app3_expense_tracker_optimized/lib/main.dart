import 'package:app3_expense_tracker_optimized/global/color_manager.dart';
import 'package:app3_expense_tracker_optimized/widgets/expenses.dart';
import 'package:flutter/material.dart';

final colorSchemeLight =
    ColorManager.colorSchemeFromSeed(ColorManager.vertEmeraude);
final colorSchemeDark =
    ColorManager.colorSchemeFromSeed(ColorManager.vertEmeraude);

void main() {
  runApp(
    MaterialApp(
      // Section Theme (2 sections: Theme clair et Theme Dark)
      // - Theme clair
      theme: ThemeData().copyWith(
        colorScheme: colorSchemeLight,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: colorSchemeLight.onPrimaryContainer,
          foregroundColor: colorSchemeLight.primaryContainer,
          centerTitle: true,
        ),
        cardTheme: const CardTheme().copyWith(
          color: colorSchemeLight.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
                titleLarge: TextStyle(
              fontWeight: FontWeight.bold,
              color: colorSchemeLight.onSecondaryContainer,
              fontSize: 20,
            )),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: colorSchemeLight.onPrimaryContainer,
            foregroundColor: colorSchemeLight.primaryContainer,
          ),
        ),
        //scaffoldBackgroundColor:
      ),
      // - Theme Sombre
      darkTheme: ThemeData.dark().copyWith(
          colorScheme: colorSchemeDark,
          cardTheme: const CardTheme().copyWith(
            color: colorSchemeDark.onSecondaryContainer,
            margin: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
            backgroundColor: colorSchemeDark.primaryContainer,
            foregroundColor: colorSchemeDark.onPrimaryContainer,
          ))),

      home: const Expences(),
    ),
  );
}
