import 'question_entity.dart';
import 'quiz_result_entity.dart';

class SubmitAnswerEntity {

  final bool isCorrect;
  final int answeredQuestions;
  final int remainingQuestions;
  final int selectedChoiceId;
  final int? correctChoiceId;
  final String? explanation;
  final QuestionEntity? nextQuestion;
  final QuizResultEntity? quizResult;

  const SubmitAnswerEntity({
    required this.isCorrect,
    required this.answeredQuestions,
    required this.remainingQuestions,
    required this.selectedChoiceId,
    this.correctChoiceId,
    this.explanation,
    this.nextQuestion,
    this.quizResult,

  });

}