import 'package:app2_questionnaire/data/questions.dart';
import 'package:app2_questionnaire/widgets/answer_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  final void Function(String, [bool]) chooseAnswer;

  const QuestionsScreen({required this.chooseAnswer, super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String answer){
    setState(() {
     
      if(currentQuestionIndex < questions.length-1) {
        widget.chooseAnswer(answer);
        currentQuestionIndex++;
        return;
      }
       widget.chooseAnswer(answer,true);
    });
  }



  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 208, 115, 236),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            ...currentQuestion.getShuffledAnswers().map(
                  (e) => AnswerButton(
                    onPressed: ()=>answerQuestion(e),
                    answerText: e,
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
