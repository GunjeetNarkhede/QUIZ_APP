class QuizQuestion {
  QuizQuestion(
    this.question,
    this.answers,
  );
  final String question;
  final List<String> answers;
  List<String> getShuffledAns() {
    final List<String> newList = List.of(answers);
    newList.shuffle();
    return newList;
  }
  // we want to shuffle the answers everytime we launch the quiz app so we create a 
  // funcntion that would return a shuffled list. we create a new list and use List.of 
  // feature of lists to create a copy of that list and store it in another list, then
  // shuffle it and return the shuffled list 
}
