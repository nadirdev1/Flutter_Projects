import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.deepPurple,
                Colors.purple,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  "assets/images/quiz-logo.png",
                  width: 300,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Learn Flutter the fun way!",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                FilledButton(
                  onPressed: () {},
                  style: FilledButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.deepPurple),
                  child: const Text('Start Quiz'),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.resolveWith((states) {
                      return states.contains(WidgetState.pressed)
                          ? Colors.red
                          : Colors.green;
                    }),
                  ),
                  child: const Text("Dynamic Color"),
                ),
                const SizedBox(
                  height: 20,
                ),
                OutlinedButton(
                  onPressed: (){}, // Bouton activé
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.resolveWith((states) {
                      if (states.contains(WidgetState.pressed)) {
                        return Colors
                            .blueGrey; // Couleur quand le bouton est pressé
                      } else if (states.contains(WidgetState.hovered)) {
                        return Colors.red; // Couleur au survol
                      } else if (states.contains(WidgetState.disabled)) {
                        return Colors.yellow; // Couleur si désactivé
                      }
                      return Colors.blue; // Couleur par défaut
                    }),
                    foregroundColor: WidgetStateProperty.all(
                        Colors.white), // Couleur du texte
                  ),
                  child: const Text("Click Me"),
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
