import 'package:flutter/material.dart';
import 'package:app3_expense_tracker/widgets/expenses.dart';

const kSeedColorRougeDrapeau = Color(0xFFc1272d); // Rouge inspiré du drapeau marocain
const kSeedColorVertEmeraude = Color(0xFF007A33); // Vert émeraude profond, symbole de l'étoile du drapeau
const kSeedColorBleuMajorelle = Color(0xFF0058A3); // Bleu vibrant inspiré du Jardin Majorelle
const kSeedColorBeigeSable = Color(0xFFD2B48C); // Teinte naturelle inspirée du désert marocain
const kSeedColorTerracotta = Color(0xFFCC4E3A); // Orange-brun chaleureux inspiré de l'architecture traditionnelle
var kColorScheme =
    ColorScheme.fromSeed(seedColor:kSeedColorBeigeSable);

var kDarkColorScheme = ColorScheme.fromSeed(
  brightness:Brightness.dark,
  seedColor: const Color.fromARGB(255, 5, 99, 125));

void main(List<String> args) {
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
       colorScheme: kDarkColorScheme, 
         cardTheme: const CardTheme().copyWith(
            color: kDarkColorScheme.secondaryContainer,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
              elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  backgroundColor: kDarkColorScheme
                      .primaryContainer,
                      foregroundColor: kDarkColorScheme.onPrimaryContainer,),), //
      ),
      // toujours utilisé .copyWith() quand c'est possible.
      theme: ThemeData().copyWith(
          colorScheme: kColorScheme,
          appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: kColorScheme.onPrimaryContainer,
            foregroundColor: kColorScheme.primaryContainer,
            //centerTitle: true,
          ),
          cardTheme: const CardTheme().copyWith(
            color: kColorScheme.secondaryContainer,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  backgroundColor: kColorScheme
                      .primaryContainer)), // pas de copywith avec ça mais plutot stylFrome. Malheureusement y a une certaine inconsistence parfois c'est .copywith() parfois c'est .stylefrom()
          textTheme: ThemeData().textTheme.copyWith(
                  titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                color: kColorScheme.onSecondaryContainer,
                fontSize: 20,
              ) //ThemeData().textTheme.titleLarge.copyWith(...)//les titres principaux comme dans le appBar
                  ))
      //scaffoldBackgroundColor:
      //elevatedButtonTheme: ElevatedButtonThemeData()

      , 
      themeMode: ThemeMode.system,// au cas je travaille sur un setup utilisant une ancienne version comme Material2. Materiel 3 est jusqu'au la version la plus récente.
      home: const Expenses(),
    ),
  );
}
