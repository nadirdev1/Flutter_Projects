import 'package:container_hello/animated_container_example.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body:Center(
       child: 
       AnimatedContainerExample(),

/*        GestureDetector(
  // Widget qui détecte les gestes de l'utilisateur (comme un clic, un double tap, un glissement, etc.)
  onTap: () => print('Button pressed'), // Action exécutée lorsqu'on tape sur ce widget (ici, un message est imprimé dans la console)
  
  child: Container( // Le `Container` agit comme une boîte contenant un contenu avec des styles
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10), 
    // Ajoute un espace interne au container : 20 pixels horizontalement (gauche et droite) et 10 pixels verticalement (haut et bas)

    decoration: BoxDecoration( // Permet de styliser le container
      color: Colors.red, // Définit la couleur de fond en rouge
      borderRadius: BorderRadius.circular(10), 
      // Ajoute des coins arrondis avec un rayon de 10 pixels

      boxShadow: [ // Définit une liste d'ombres pour le container
        BoxShadow(
          color: Colors.black38, // Ombre semi-transparente de couleur noire
          offset: Offset(2, 4), // Décalage de l'ombre : 2 pixels à droite et 4 pixels vers le bas
          blurRadius: 5, // Rayon de flou pour adoucir l'ombre
        ),
      ],
    ),

    child: Text( // Contenu du container : un texte
      'Click Me', // Texte affiché dans le container
      style: TextStyle( // Style appliqué au texte
        color: Colors.white, // Couleur du texte : blanc
        fontSize: 16, // Taille de la police : 16 pixels
      ),
    ),
  ),
)
 */

/* // Combinez un Container avec un Stack pour créer des arrière-plans complexes.
Stack(
  children: [
    // Premier enfant : Arrière-plan
    Container(
      width: double.infinity, // Prend toute la largeur de l'écran
      height: 300, // Hauteur fixe de 300 pixels
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: [Colors.pink, Colors.deepPurple], // Dégradé radial du rose au violet
          center: Alignment.center, // Centre du dégradé au centre du container
          radius: 1.0, // Rayon du dégradé
        ),
      ),
    ),
    // Deuxième enfant : Texte centré en bas
    Align(
      alignment: Alignment.bottomCenter, // Aligne le container en bas-centre du Stack
      child: Container(
        width: 100, // Largeur du container
        height: 50, // Hauteur du container
        color: Colors.white, // Fond blanc
        child: Text(
          'Hello!', // Texte affiché
          textAlign: TextAlign.center, // Centre le texte horizontalement
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold), // Style du texte
        ),
      ),
    ),
  ],
)


 */
/* 
        LayoutBuilder(
      // LayoutBuilder permet d'adapter le contenu en fonction des contraintes de la taille de l'écran
      // il donne accés à l'objet BoxConstraints, qui contient les dimensions maximales et minimales de l'écran ou le widget est rendu
      builder: (context, constraints) {
        // context : Le contexte courant (informations sur le widget)
        // constraints : Contient les limites de taille max/min disponibles pour le widget enfant
        return Center(
          // Centrer le contenu dans l'écran
          child: Container(
            // Un widget flexible qui peut contenir un contenu avec des styles
            width: constraints.maxWidth * 0.1, // Définit la largeur à 50% de l'écran
            height: constraints.maxHeight * 0.3, // Définit la hauteur à 30% de l'écran
            color: Colors.teal, // Applique une couleur de fond au container
            child: Text(
              'Responsive Container', // Texte affiché au centre du container
              textAlign: TextAlign.center, // Centre le texte horizontalement
              style: TextStyle(
                color: Colors.white, // Couleur blanche pour le texte
                fontSize: 16, // Taille de police
                fontWeight: FontWeight.bold, // Met le texte en gras
              ),
            ),
          ),
        );
      },
    ), */

/* Container(
  width: 400, // Largeur du container fixée à 200 pixels
  height: 200, // Hauteur du container fixée à 200 pixels
  decoration: BoxDecoration(
    color: Colors.orange, // Couleur de fond orange
    borderRadius: BorderRadius.circular(30), // Coins arrondis avec un rayon de 30 pixels
  ),
  clipBehavior: Clip.hardEdge, // Coupe le contenu pour qu'il reste à l'intérieur des bords arrondis
  child: Image.network(
    'https://via.placeholder.com/100', // Image chargée depuis l'URL spécifiée
   fit: BoxFit.cover, // L'image est redimensionnée pour couvrir tout le container
  ),
)
        
        
         */
        
/*         Container(
          width: 200,
          height: 200,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                // Définition de la couleur de l'ombre
                // Ici, Colors.black26 correspond à une couleur noire avec une opacité de 26%
                color: Colors.blue,

                // Rayon de flou pour rendre l'ombre douce et diffuse
                // Plus la valeur est élevée, plus l'ombre est floutée (ici 10 pixels)
                blurRadius: 10,

                // Décalage horizontal et vertical de l'ombre
                // Offset(x, y) : x = 2 (décalage vers la droite), y = 5 (décalage vers le bas)
                offset: Offset(2, 5),
              ),
              // Première ombre - douce et légère
              BoxShadow(
                color: Colors.red,
                blurRadius: 1,
                offset: Offset(2, 5),
              ),
              // Deuxième ombre - plus sombre et plus proche
              BoxShadow(
                color: Colors.green,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: const Text(
            'Container',
            style: TextStyle(color: Colors.white),
          ),
        ), */


      ),
   ),
  ));
}
