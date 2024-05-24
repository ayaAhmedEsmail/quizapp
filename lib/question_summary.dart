import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({required this.summaryData, super.key});
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((e) {
            if (e['user-answer'] == e['correct-answer']) {}

            return Row(children: [
              CircleAvatar(
                backgroundColor: e['user-answer'] == e['correct-answer']
                    ? const Color.fromARGB(204, 19, 142, 172)
                    : const Color.fromARGB(255, 210, 108, 99),
                child: Text(((((e['question-index']) as int) + 1)).toString(),
                    style: const TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255))),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 22),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          (e['Question']) as String,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text((e['user-answer']) as String,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 190, 9, 9))),
                        const SizedBox(
                          height: 10,
                        ),
                        Text((e['correct-answer']) as String,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                color: Color.fromARGB(199, 25, 128, 2))),
                        const Text("________________________________________"),
                      ]),
                ),
              ),
            ]);
          }).toList(),
        ),
      ),
    );
  }
}
