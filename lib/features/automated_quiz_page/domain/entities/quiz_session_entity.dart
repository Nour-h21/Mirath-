import 'question_entity.dart';

class QuizSessionEntity {

  final int sessionId;

  final int estimatedDuration;

  final int totalQuestions;

  final QuestionEntity firstQuestion;

  const QuizSessionEntity({

    required this.sessionId,

    required this.estimatedDuration,

    required this.totalQuestions,

    required this.firstQuestion,
  });

}