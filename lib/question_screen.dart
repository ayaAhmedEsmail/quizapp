import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/answer_btn.dart';
import 'package:quizapp/data/questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QustionState();
  }
}

class _QustionState extends State<QuestionScreen> {
  var curentInex = 0;

  @override
  Widget build(BuildContext context) {
    void answersIndex() {
      setState(() {
        curentInex++;
      });
    }

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
            ...currentQuestion.getShuffledAnswers().map((e) {
              return QuestionBtn(
                onTap: answersIndex,
                answer: e,
              );
            })
          ]),
    );
  }
}
