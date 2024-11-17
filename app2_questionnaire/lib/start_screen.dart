import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz,{super.key});

  final void Function() startQuiz;


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/quiz-logo.png",
            width: 300,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          // Opacity est très gourmand
          // Opacity(
          //   opacity: 0.5,
          //   child: Image.asset(
          //     "assets/images/quiz-logo.png",
          //     width: 300,
          //   ),
          // ),
          const SizedBox(
            height: 60,
          ),
          Text(
            "Flutter the fun way!",
            style: GoogleFonts.lato(
              color: Colors.amber,
              fontSize: 24
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              side: const BorderSide(
                strokeAlign: 1,
                color: Color.fromARGB(255, 143, 91, 186),
                width: 1,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  10,
                ),
              ),
              foregroundColor: Colors.white,
            ),
            // style: ButtonStyle(
            //   foregroundColor: WidgetStateProperty.resolveWith((states) {
            //     if (states.contains(WidgetState.pressed)) {
            //       return Colors.red; // Couleur lorsqu'appuyé
            //     }
            //     return Colors.blue; // Couleur par défaut
            //   }),
            //   shape: WidgetStateProperty.all(
            //     RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(12),
            //     ),
            //   ),
            // ),
            label: const Text("Start Quiz"),
            icon: const Icon(Icons.arrow_right_alt),
          )
        ],
      ),
    );
  }
}
