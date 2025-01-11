import 'package:flutter/material.dart';

/// Fichier global pour toutes les constantes liées à la mise en page.
///
/// Ce fichier centralise les marges, paddings, espacements, et rayons de bordures
/// pour assurer une cohérence dans tout le projet.
class LayoutConstants {
  // Marges
  /// Marges symétriques (horizontal: 16, vertical: 8).
  static const EdgeInsets sym16H_8V =
      EdgeInsets.symmetric(horizontal: 16, vertical: 8);

  static const EdgeInsets sym8H_16V =
      EdgeInsets.symmetric(horizontal: 16, vertical: 8);

  /// Marges symétriques (horizontal: 24, vertical: 12).
  static const EdgeInsets sym24H_12V =
      EdgeInsets.symmetric(horizontal: 24, vertical: 12);

  // Paddings
  /// Padding uniforme de 16.
  static const EdgeInsets all16 = EdgeInsets.all(16);

  /// Padding symétrique horizontal de 12.
  static const EdgeInsets symHor12 = EdgeInsets.symmetric(horizontal: 12);

  // Espacements
  /// Espace vertical de 8.
  static const SizedBox spaceH8 = SizedBox(height: 8);

  /// Espace vertical de 16.
  static const SizedBox spaceH16 = SizedBox(height: 16);

  /// Espace horizontal de 8.
  static const SizedBox spaceW8 = SizedBox(width: 8);

  /// Espace horizontal de 16.
  static const SizedBox spaceW16 = SizedBox(width: 16);

  // Rayon des bordures
  /// Rayon de bordure uniforme de 8.
  static const BorderRadius borderRadiusAll8 =
      BorderRadius.all(Radius.circular(8));

  /// Rayon de bordure uniforme de 16.
  static const BorderRadius borderRadiusAll16 =
      BorderRadius.all(Radius.circular(16));
}
