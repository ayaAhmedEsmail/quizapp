import 'package:flutter/material.dart';
import 'package:quizapp/import_img.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        const MyImg(),
        const SizedBox(
          height: 30,
        ),
        Text(
          'learn in fun way',
          style: GoogleFonts.lato(
              fontSize: 40, color: const Color.fromARGB(255, 255, 255, 255)),
        ),
        const SizedBox(
          height: 20,
        ),
        OutlinedButton.icon(
            style: ButtonStyle(
                fixedSize: MaterialStateProperty.all<Size>(
              const Size(200.0, 50.0), // Button width and height
            )),
            icon: const Icon(Icons.arrow_right),
            onPressed: startQuiz,
            label: Text(
              "Start Quiz",
              style: GoogleFonts.lato(fontSize: 25, color: Colors.white),
            ))
      ]),
    );
  }
}
