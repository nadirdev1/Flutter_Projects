import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GroupedContactsList(),
    );
  }
}

class GroupedContactsList extends StatelessWidget {
  final Map<String, List<String>> contacts = {
    'A': ['Alice', 'Adam', 'Arthur'],
    'B': ['Bob', 'Barbara'],
    'C': ['Charles', 'Catherine', 'Clara'],
  };

  @override
  Widget build(BuildContext context) {
    // Calculer le nombre total de widgets (sections + contacts)
    final List<String> sectionHeaders = contacts.keys.toList();
    final int totalItems = sectionHeaders.fold(
      0,
      (total, key) => total + contacts[key]!.length + 1, // +1 pour l'en-tête
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts Groupés'),
      ),
      body: ListView.custom(
        childrenDelegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            int runningIndex = 0;

            for (String header in sectionHeaders) {
              // Ajouter l'en-tête de section
              if (index == runningIndex) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    header,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                );
              }
              runningIndex++;

              // Ajouter les contacts de cette section
              for (String contact in contacts[header]!) {
                if (index == runningIndex) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text(contact[0]), // Première lettre
                    ),
                    title: Text(contact),
                  );
                }
                runningIndex++;
              }
            }

            return null; // Ne rien afficher en dehors des indices calculés
          },
          childCount: totalItems,
        ),
      ),
    );
  }
}