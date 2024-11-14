import 'package:flutter/material.dart';

class TextFieldCust extends StatelessWidget {
  const TextFieldCust({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        labelText: 'Entrez votre texte',
        border: OutlineInputBorder(), // Bordure autour du champ
        prefixIcon: Icon(Icons.person), // Icône au début
      ),
    );
  }
}
