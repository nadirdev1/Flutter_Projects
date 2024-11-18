// Classe principale qui représente un StatefulWidget
import 'package:flutter/material.dart';

class AnimatedContainerExample extends StatefulWidget {
  @override
  _AnimatedContainerExampleState createState() =>
      _AnimatedContainerExampleState(); // Crée un état associé à ce widget
}

// Classe qui gère l'état du widget
class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {
  // Variable d'état qui détermine si le container est grand ou petit
  bool isBig = false; // Initialisé à false (petit état)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Structure de base de l'interface utilisateur
      body: Center(
        // Centre le contenu sur l'écran
        child: GestureDetector(
          // Détecte les interactions de l'utilisateur (par exemple, un clic)
          onTap: () {
            // Lorsque l'utilisateur tape sur le container
            setState(() {
              // Met à jour l'état en inversant la valeur de isBig
              isBig = !isBig;
            });
          },
          child: AnimatedContainer(
            // Un container animé qui change en douceur ses propriétés définies
            duration: Duration(seconds: 1), // Durée de l'animation : 1 seconde

            // Largeur du container : 300 si isBig est vrai, sinon 100
            width: isBig ? 300 : 100,

            // Hauteur du container : 300 si isBig est vrai, sinon 100
            height: isBig ? 300 : 100,

            decoration: BoxDecoration(
              // Change la couleur du container : bleu si isBig est vrai, sinon rouge
              color: isBig ? Colors.blue : Colors.red,

              // Change la forme du container : coins arrondis (rayon 50) si isBig est vrai, sinon aucun arrondi (rayon 0)
              borderRadius: BorderRadius.circular(isBig ? 50 : 0),
            ),
          ),
        ),
      ),
    );
  }
}