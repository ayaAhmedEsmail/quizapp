import 'package:flutter/material.dart';

class QuestionBtn extends StatelessWidget {
  const QuestionBtn({required this.answer, required this.onTap, super.key});
  final String answer;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 16, 0, 50),
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      ),
      onPressed: onTap,
      child: Text(
        answer,
        textAlign: TextAlign.center,
      ),
    );
  }
}
