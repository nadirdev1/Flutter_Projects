import 'package:app2_questionnaire/data/questions.dart';
import 'package:app2_questionnaire/questions_screen.dart';
import 'package:app2_questionnaire/result_screen.dart';
import 'package:app2_questionnaire/start_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  Map<String, Widget> screens = {};

  @override
  void initState() {
    screens = {
      'start-screen': StartScreen(switchScreen),
      'questions-screen': QuestionsScreen(onChooseAnswer: chooseAnswer),
      'results-screen': ResultScreen(
          chosenAnswers: selectedAnswers, switchScreen: switchScreen),
    };

    super.initState();
  }

  final List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      selectedAnswers.clear();

      activeScreen =
          activeScreen == 'start-screen' ? 'questions-screen' : 'start-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
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
          child: screens[activeScreen] ?? const Text("Unknown screen"),
        ),
      ),
    );
  }
}
