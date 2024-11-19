class QuizQuestion{

  const QuizQuestion(this.text,this.answers);
  final List<String>answers;
  final String text;

   List<String>getShuffleList(){
     final shuffledList = List.of(answers);  //cannot directly returned a shuffled List therefore use a final variable
     shuffledList.shuffle();
     return shuffledList;
  }
}
