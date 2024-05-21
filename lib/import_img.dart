import 'package:flutter/material.dart';

class MyImg extends StatelessWidget {
  const MyImg({super.key});

  @override
  Widget build(context) {
    return Image.asset(
      'assets/images/logo.png',
      width: 330,
      color: const Color.fromARGB(140, 255, 255, 255),
    );
  }
}
