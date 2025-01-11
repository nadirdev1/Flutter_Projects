import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SnackBar Examples',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const SnackBarExample(),
    );
  }
}

class SnackBarExample extends StatelessWidget {
  const SnackBarExample({Key? key}) : super(key: key);

  // 1. SnackBar Basique
  void _showBasicSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Ceci est une SnackBar basique !'),
      ),
    );
  }

  // 2. SnackBar avec action
  void _showSnackBarWithAction(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Ceci est une SnackBar avec une action.'),
        action: SnackBarAction(
          label: 'Annuler',
          onPressed: () {
            debugPrint(
                'Action annulée'); // Action effectuée lorsque l'utilisateur clique sur "Annuler"
          },
        ),
      ),
    );
  }

  // 3. SnackBar personnalisée (couleur et durée)
  void _showCustomSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text(
          'Ceci est une SnackBar personnalisée.',
          style: TextStyle(color: Colors.white), // Texte personnalisé
        ),
        backgroundColor: Colors.blue, // Couleur de fond
        duration: const Duration(seconds: 5), // Durée prolongée
      ),
    );
  }

  // 4. SnackBar avancée avec widget (progrès ou image)
  void _showAdvancedSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: const [
            CircularProgressIndicator(
                color: Colors.white), // Indicateur de progression
            SizedBox(width: 16), // Espacement
            Expanded(
              child: Text(
                'Chargement en cours...',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.green, // Couleur de fond
      ),
    );
  }

  // 5. SnackBar avec suppression et remplacement (fermer automatiquement)
  void _showReplaceableSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context)
        .removeCurrentSnackBar(); // Supprime une SnackBar existante si présente
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Cette SnackBar remplace la précédente.'),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  // 6. SnackBar persistante avec bouton pour fermer
  void _showPersistentSnackBar(BuildContext context) {
    final snackBar = SnackBar(
      content: const Text('SnackBar persistante (manuelle).'),
      duration: const Duration(
          days: 1), // Durée très longue pour rendre la SnackBar persistante
      action: SnackBarAction(
        label: 'Fermer',
        onPressed: () {
          ScaffoldMessenger.of(context)
              .hideCurrentSnackBar(); // Ferme la SnackBar manuellement
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SnackBar Examples'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () => _showBasicSnackBar(context),
              child: const Text('SnackBar Basique'),
            ),
            ElevatedButton(
              onPressed: () => _showSnackBarWithAction(context),
              child: const Text('SnackBar avec Action'),
            ),
            ElevatedButton(
              onPressed: () => _showCustomSnackBar(context),
              child: const Text('SnackBar Personnalisée'),
            ),
            ElevatedButton(
              onPressed: () => _showAdvancedSnackBar(context),
              child: const Text('SnackBar Avancée'),
            ),
            ElevatedButton(
              onPressed: () => _showReplaceableSnackBar(context),
              child: const Text('SnackBar Remplaçable'),
            ),
            ElevatedButton(
              onPressed: () => _showPersistentSnackBar(context),
              child: const Text('SnackBar Persistante'),
            ),
          ],
        ),
      ),
    );
  }
}
