import 'package:flutter/material.dart';
import 'package:quizapp/Firstpage.dart';
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/question_screen.dart';
import 'package:quizapp/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'start-screen';
  List<String> selectedAnswer = []; // list to store selected answers

// to switch to Result screen after the questions has been answered
  void choosenAnswer(answer) {
    selectedAnswer.add(answer);
    if (selectedAnswer.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  // method to switch to the Question screen
  void switchScreen() {
    setState(() {
      activeScreen = "question-screen";
    });
  }

  void onRstartQuiz() {
    setState(() {
      selectedAnswer = [];
      activeScreen = "question-screen";
    });
  }

  // initalizing Start screen as a first screen
  @override
  void initState() {
    if (activeScreen == 'start-screen') {
      StartScreen(switchScreen);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);

//select which screen to display based on the activeScreen variable
    if (activeScreen == 'start-screen') {
      screenWidget = StartScreen(switchScreen);
    } else if (activeScreen == 'question-screen') {
      screenWidget = QuestionScreen(onSelectedAnwser: choosenAnswer);
    } else if (activeScreen == 'result-screen') {
      screenWidget = ResultScreen(
        choosenAnswer: selectedAnswer,
        onReload: onRstartQuiz,
      );
    } else {
      screenWidget = StartScreen(switchScreen);
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: screenWidget,
        backgroundColor: const Color.fromARGB(255, 51, 34, 77),
      ),
    );
  }
}
