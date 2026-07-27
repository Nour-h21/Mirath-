class QuizResultEntity {

  final bool success;

  final int correctAnswers;

  final int percentage;

  final int newPoints;

  final int totalPoints;

  final int totalQuestions;
  // final int chapterId;

  const QuizResultEntity( {

    required this.success,

    required this.correctAnswers,

    required this.percentage,

    required this.newPoints,

    required this.totalPoints,

    required this.totalQuestions,
    
    // required this.chapterId,

  });

}