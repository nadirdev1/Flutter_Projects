import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dialog Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const DialogExample(),
    );
  }
}

class DialogExample extends StatelessWidget {
  const DialogExample({Key? key}) : super(key: key);

  // Fonction pour afficher une séquence de boîtes de dialogue
  void _showDialogs(BuildContext context) async {
    // 1. Afficher une AlertDialog (Message d'erreur)
    await showDialog(
      barrierDismissible:
          false, // Empêche la fermeture en cliquant à l'extérieur
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Icon(
              Icons.error,
              color: Theme.of(context)
                  .colorScheme
                  .errorContainer, // Couleur dynamique du thème
            ),
            const SizedBox(width: 8), // Espacement entre l'icône et le texte
            Text(
              'Erreur',
              style: TextStyle(
                color: Theme.of(context)
                    .colorScheme
                    .error, // Style dynamique pour le texte
              ),
            ),
          ],
        ),
        content: const Text(
            'Ceci est une alerte d\'erreur.'), // Contenu du message d'erreur
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(), // Ferme le dialogue
            child: const Text("Fermer"),
          ),
        ],
      ),
    );

    // 2. Afficher une boîte de dialogue personnalisée
    await showDialog(
      context: context,
      builder: (ctx) => Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Ajuste la taille au contenu
            children: [
              const Text(
                'Titre personnalisé',
                style: TextStyle(fontSize: 20), // Style du titre
              ),
              const SizedBox(height: 16), // Espacement
              const Text('Ceci est un contenu personnalisé.'), // Contenu
              const SizedBox(height: 16), // Espacement
              ElevatedButton(
                onPressed: () => Navigator.of(ctx).pop(), // Ferme le dialogue
                child: const Text('Fermer'),
              ),
            ],
          ),
        ),
      ),
    );

    // 3. Afficher un SimpleDialog avec des options interactives
    final text = await showDialog<String>(
      context: context,
      builder: (ctx) => SimpleDialog(
        title: const Text('Options'),
        children: [
          SimpleDialogOption(
            onPressed: () => Navigator.of(ctx)
                .pop('Option 1'), // Retourne 'Option 1' à l'appelant
            child: const Text('Option 1'),
          ),
          SimpleDialogOption(
            onPressed: () => Navigator.of(ctx)
                .pop('Option 2'), // Retourne 'Option 2' à l'appelant
            child: const Text('Option 2'),
          ),
        ],
      ),
    );
    debugPrint(
        'Utilisateur a sélectionné : $text'); // Affiche la sélection dans la console

    // 4. Afficher une boîte de dialogue avec une transition personnalisée
    Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false, // Permet de voir les éléments derrière le dialogue
        pageBuilder: (context, animation, secondaryAnimation) {
          return FadeTransition(
            opacity: animation, // Transition de fondu pour afficher le dialogue
            child: Dialog(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min, // Ajuste la taille au contenu
                  children: [
                    const Text(
                      'Transition personnalisée',
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 16), // Espacement
                    const Text(
                      'Cette boîte de dialogue utilise une animation personnalisée.',
                    ),
                    const SizedBox(height: 16), // Espacement
                    ElevatedButton(
                      onPressed: () =>
                          Navigator.of(context).pop(), // Ferme le dialogue
                      child: const Text('Fermer'),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          // Définir l'animation personnalisée (glissement de bas en haut)
          const begin = Offset(0.0, 1.0); // Position initiale (hors écran)
          const end = Offset.zero; // Position finale (écran visible)
          const curve = Curves.ease; // Courbe de l'animation

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation, // Animation de glissement
            child: child,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dialog Example'), // Titre de l'application
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () =>
              _showDialogs(context), // Lance la séquence de dialogues
          child: const Text('Afficher les Dialogs'),
        ),
      ),
    );
  }
}
