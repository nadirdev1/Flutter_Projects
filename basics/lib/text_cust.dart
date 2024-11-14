import 'package:flutter/material.dart';

class TextCust extends StatelessWidget {
  const TextCust({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Flutter Decoration',
      style: TextStyle(
        color: Colors.yellow,
        decoration: TextDecoration.underline, // Souligné
        fontSize: 20,
        decorationColor: Colors.red, // Couleur du soulignement
        decorationStyle: TextDecorationStyle.solid, // Style du soulignement
        // shadows: [
        //   Shadow(
        //     color: Colors.red,
        //     offset: Offset(0,
        //         -1), // Positionne l'ombre légèrement au-dessus pour l'épaisseur
        //     blurRadius: 1, // Flou pour un effet plus lisse
        //   ),
        // ],
        fontWeight: FontWeight.bold, // Met le texte en gras si nécessaire
      ),
    );
  }
}
