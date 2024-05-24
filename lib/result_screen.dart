import 'package:flutter/material.dart';
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.choosenAnswer, required this.onReload});
  final List<String> choosenAnswer;
  final void Function() onReload;
  List<Map<String, Object>> getSummeryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenAnswer.length; i++) {
      summary.add({
        'question-index': i,
        'Question': questions[i].txt,
        'correct-answer': questions[i].answers[0],
        'user-answer': choosenAnswer[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final totalQuestion = questions.length;
    final dataSummry = getSummeryData();

    final totalCorrectAnswers = dataSummry
        .where((element) => element['user-answer'] == element['correct-answer'])
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You Answerd $totalCorrectAnswers of $totalQuestion Questions Correctely",
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
            const SizedBox(
              height: 30,
            ),

            // Get UI from class Question summary..
            QuestionsSummary(summaryData: getSummeryData()),

            Center(
              child: TextButton.icon(
                  onPressed: onReload,
                  icon: const Icon(
                    Icons.refresh,
                    color: Color.fromARGB(137, 255, 255, 255),
                  ),
                  label: const Text(
                    "Restart Quiz..",
                    style: TextStyle(color: Color.fromARGB(221, 255, 255, 255)),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
