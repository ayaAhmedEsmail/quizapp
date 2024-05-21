class QuizQuestion {
  const QuizQuestion(this.txt, this.answers);
  final String txt;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
