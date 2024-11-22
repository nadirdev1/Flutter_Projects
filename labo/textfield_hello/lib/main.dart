import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text('Advanced TextField Example')),
      body: const Column(
        children: [
          TextField(
            maxLength: 50,
            decoration: InputDecoration(
              //label: Text('Title'), // ajoute un widget comme label
              labelText: 'Entrez votre texte',
              border: OutlineInputBorder(), // Bordure autour du champ
              prefixIcon: Icon(Icons.person), // Icône au début
            ),
          ),
          TextField(
            decoration: InputDecoration(
              label: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.email, color: Colors.blue),
                  SizedBox(width: 8),
                  Text(
                    'Email Address',
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
              border: OutlineInputBorder(),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: AdvancedTextField(),
          ),
        ],
      ),
    ),
  ));
}

class AdvancedTextField extends StatefulWidget {
  const AdvancedTextField({super.key});

  @override
  _AdvancedTextFieldState createState() => _AdvancedTextFieldState();
}

class _AdvancedTextFieldState extends State<AdvancedTextField> {
  final TextEditingController _controller = TextEditingController();
  bool _isValid = true; // State to track validation status

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      keyboardType: TextInputType.emailAddress, // Email input type
      obscureText: false, // Not hiding input (used for passwords)
      onChanged: (value) {
        // Validate input as an email
        setState(() {
          _isValid = RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value);
        });
      },
      decoration: InputDecoration(
        // Complex label with an icon and styled text
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.email, color: _isValid ? Colors.green : Colors.red),
            const SizedBox(width: 8),
            Text(
              _isValid ? 'Email Address' : 'Invalid Email',
              style: TextStyle(color: _isValid ? Colors.green : Colors.red),
            ),
          ],
        ),

        // Placeholder text inside the TextField
        hintText: 'Enter your email here',
        hintStyle:
            const TextStyle(fontStyle: FontStyle.italic, color: Colors.grey),

        // Prefix icon inside the TextField
        prefixIcon: const Icon(Icons.alternate_email, color: Colors.blue),

        // Suffix icon with a clear action
        suffixIcon: _controller.text.isNotEmpty
            ? IconButton(
                icon: const Icon(Icons.clear, color: Colors.grey),
                onPressed: () {
                  setState(() {
                    _controller.clear(); // Clear the input
                    _isValid = true; // Reset validation
                  });
                },
              )
            : null,

        // Customized border styles
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.blue, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
      ),

      // Text styling inside the TextField
      style: const TextStyle(fontSize: 16, color: Colors.black),
    );
  }
}

/**
 * Fonctionnalités incluses dans cet exemple :

	1.	Label complexe :
	•	Le label est une combinaison d’une icône et de texte (géré dynamiquement pour indiquer si l’e-mail est valide).
	2.	Validation en temps réel :
	•	Chaque fois que le texte est modifié (onChanged), une validation est effectuée avec une expression régulière (vérifie si c’est un e-mail valide).
	3.	Icone de préfixe et de suffixe :
	•	Une icône de préfixe est ajoutée pour l’esthétique.
	•	Une icône de suffixe clear permet de vider le champ rapidement lorsque du texte est présent.
	4.	Bordures personnalisées :
	•	Des bordures distinctes sont définies pour les états normal, focus et erreur.
	5.	Style de texte :
	•	Personnalisation du texte et du placeholder (hint).
	6.	Contrôle dynamique de la validation :
	•	Si l’entrée est invalide, les couleurs et les styles changent dynamiquement (texte rouge, icône rouge, etc.).

 */
