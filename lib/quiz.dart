import 'package:flutter/material.dart';
import 'package:quizapp/Firstpage.dart';
import 'package:quizapp/question_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;

  @override
  void initState() {
    print("in initState");

    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      print("in setState");
      activeScreen = const QuestionScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: activeScreen,
        backgroundColor: const Color.fromARGB(255, 51, 34, 77),
      ),
    );
  }
}
