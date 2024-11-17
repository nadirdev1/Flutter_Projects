import 'package:app2_questionnaire/questions_screen.dart';
import 'package:app2_questionnaire/start_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  final List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  void switchScreen([bool end = false]) {
    setState(() {
      if (!end) {
        activeScreen = 'questions-screen';
      } else {
        activeScreen = 'feed-back-screen';
      }
    });
  }

  void chooseAnswer(String answer, [bool end = false]) {
    selectedAnswers.add(answer);
    if(end){
      switchScreen(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screens = {
      'start-screen': StartScreen(switchScreen),
      'questions-screen': QuestionsScreen(chooseAnswer: chooseAnswer),
      'feed-back-screen': const Text("END"),
    };
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

          // activeScreen == 'start-screen'
          //     ? StartScreen(switchScreen)
          //     : QuestionsScreen(chooseAnswer: chooseAnswer,),
        ),
      ),
    );
  }
}
