import 'package:flutter/material.dart';

/// Classe contenant toutes les couleurs utilisées dans l'application.
///
/// Cette classe standardise les couleurs en les déclarant en tant que
/// constantes (`static const`) pour garantir leur immuabilité et leur
/// optimisation en mémoire. Chaque couleur est commentée pour indiquer
/// son rôle ou son inspiration.
class ColorManager {
  // Générateur de schéma de couleurs clair
  static ColorScheme colorSchemeFromSeed(Color seedColor) {
    return ColorScheme.fromSeed(
      seedColor: seedColor,
    );
  }

  // Générateur de schéma de couleurs sombre
  static ColorScheme colorSchemeFromSeedDark(Color seedColor) {
    return ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: seedColor,
    );
  }

  // Rouge inspiré du drapeau marocain
  static const Color rougeDrapeau = Color(0xFFC1272D); // Rouge vif
  static const Color rougeDrapeauARGB =
      Color.fromARGB(255, 193, 39, 45); // Rouge profond

  // Vert émeraude profond, symbole de l'étoile du drapeau
  static const Color vertEmeraude = Color(0xFF007A33); // Vert émeraude
  static const Color vertEmeraudeARGB =
      Color.fromARGB(255, 0, 122, 51); // Vert éclatant

  // Bleu vibrant inspiré du Jardin Majorelle
  static const Color bleuMajorelle = Color(0xFF0058A3); // Bleu intense
  static const Color bleuMajorelleARGB =
      Color.fromARGB(255, 0, 88, 163); // Bleu Majorelle

  // Beige sable, inspiré du désert marocain
  static const Color beigeSable = Color(0xFFD2B48C); // Beige doux
  static const Color beigeSableARGB =
      Color.fromARGB(255, 210, 180, 140); // Beige chaud

  // Orange-brun chaleureux inspiré de l'architecture traditionnelle marocaine
  static const Color terracotta = Color(0xFFCC4E3A); // Terracotta profond
  static const Color terracottaARGB =
      Color.fromARGB(255, 204, 78, 58); // Terracotta riche

  // Couleur principale, souvent utilisée comme arrière-plan ou pour les éléments dominants
  static const Color primary = Color(0xFFFFFFFF); // Blanc pur

  // Couleur utilisée pour les étiquettes et les textes secondaires
  static const Color labelsColor = Color(0xFF735BF2); // Violet clair

  // Bleu clair, idéal pour des thèmes ou des boutons légers
  static const Color lightBlue = Color(0xFF738C96); // Bleu-gris doux

  // Gris clair, utile pour des fonds ou des séparateurs subtils
  static const Color greyColor = Color(0xFFD9D9D9); // Gris clair uniforme

  // Rouge vif, utilisé pour les actions importantes ou les messages d'alerte
  static const Color redColor = Color(0xFFFF0000); // Rouge pur

  // Violet foncé, idéal pour les éléments accrocheurs ou les accents
  static const Color purpleColor = Color(0xFF2900FF); // Violet profond

  // Vert clair, utilisé pour représenter des actions positives ou validées
  static const Color greenLightColor = Color(0xFF219653); // Vert clair

  // Bleu standard pour des éléments tels que des liens ou des boutons
  static const Color blueColor =
      Color(0xFF2900FF); // Même couleur que `appPurpleColor`

  // Couleur principale alternative, souvent utilisée pour les thèmes sombres
  static const Color primary2 = Color(0xFF607D8B); // Bleu-gris profond

  // Gris foncé, parfait pour les textes secondaires ou des fonds sombres
  static const Color darkGrey = Color(0xFF525252); // Gris foncé

  // Gris standard, utile pour les textes ou éléments moins mis en avant
  static const Color grey = Color(0xFF737477); // Gris moyen

  // Gris très clair, idéal pour des fonds discrets ou des séparateurs
  static const Color lightGrey = Color(0xFFD3D3D3); // Gris clair

  // Couleur principale avec 70% d'opacité, souvent utilisée pour des overlays
  static const Color primaryOpacity70 =
      Color(0xB3ED9728); // Couleur principale transparente

  // Variante foncée de la couleur principale, pour des contrastes ou des thèmes sombres
  static const Color darkPrimary = Color(0xFFD17D11); // Orange foncé

  // Gris utilisé pour des éléments de texte ou des bordures
  static const Color grey1 = Color(0xFF707070); // Gris sombre

  // Gris légèrement plus clair pour des nuances
  static const Color grey2 = Color(0xFF797979); // Gris légèrement différent

  // Blanc pur, utilisé pour des fonds ou des contrastes
  static const Color white =
      Color(0xFFFFFFFF); // Blanc pur (même que `primary`)

  // Rouge d'erreur, utilisé pour indiquer des erreurs ou des états critiques
  static const Color error = Color(0xFFE61F34); // Rouge d'alerte

  // Vert de succès, utilisé pour représenter des actions réussies ou des états validés
  static const Color success = Color(0xFF00B383); // Vert validation
}

/// Extension sur la classe [Color] pour ajouter une méthode utilitaire.
///
/// La méthode statique [fromHex] permet de créer une instance de [Color]
/// à partir d'une chaîne hexadécimale représentant une couleur.
///
/// Cette méthode est utile pour manipuler des couleurs au format hexadécimal
/// couramment utilisé dans les fichiers de style ou les codes couleur web.
///
/// Exemple d'utilisation :
/// ```dart
/// Color myColor = AppColor.fromHex("#FF5733"); // Couleur orange
/// ```
extension AppColor on Color {
  /// Convertit une chaîne hexadécimale en une instance de [Color].
  ///
  /// Le paramètre [hexColorSting] doit être une chaîne au format hexadécimal
  /// avec un préfixe '#' (ex. "#FFFFFF").
  /// - Si le préfixe '#' est trouvé, il est remplacé par 'FF', représentant
  ///   une opacité complète (100%).
  ///
  /// Renvoie : Une instance immuable de [Color].
  ///
  /// Exemple :
  /// ```dart
  /// Color myColor = AppColor.fromHex("#123ABC");
  /// ```
  static Color fromHex(String hexColorSting) {
    hexColorSting = hexColorSting.replaceFirst('#', 'FF');
    return Color(int.parse("0xFF$hexColorSting"));
  }
}
