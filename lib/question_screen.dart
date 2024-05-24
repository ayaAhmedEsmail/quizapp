import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/answer_btn.dart';
import 'package:quizapp/data/questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({required this.onSelectedAnwser, super.key});

  final void Function(String answer) onSelectedAnwser;
  @override
  State<StatefulWidget> createState() {
    return _QustionState();
  }
}

class _QustionState extends State<QuestionScreen> {
  final List<String> selectedAnswer = [];
  var curentInex = 0;

  void answersQuestion(String selectedAnswer) {
    widget.onSelectedAnwser(selectedAnswer);
    setState(() {
      curentInex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[curentInex];
    return Container(
      margin: const EdgeInsets.all(30),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(currentQuestion.txt,
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),

            // we use ... as it called "spread operator" -> used to insert the elements of a collection into another collection
            // we have a list of btn and list of current questions.
            ...currentQuestion.getShuffledAnswers().map((e) {
              return QuestionBtn(
                onTap: () {
                  answersQuestion(e);
                },
                answer: e,
              );
            })
          ]),
    );
  }
}
