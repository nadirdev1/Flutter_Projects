import 'package:app2_questionnaire/questions_screen.dart';
import 'package:app2_questionnaire/start_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
    Widget? activeScreen;

    @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }


  void switchScreen() {
    setState(() {
      activeScreen = const QuestionsScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 87, 2, 234),
                  Color.fromARGB(255, 63, 19, 82),
                ],
              ),
            ),
            child: activeScreen),
      ),
    );
  }
}
