import '../../domain/entities/quiz_session_entity.dart';
import 'question_model.dart';

class QuizSessionModel extends QuizSessionEntity {
  QuizSessionModel({
    required super.sessionId,
    required super.estimatedDuration,
    required super.totalQuestions,
    required super.firstQuestion,
  });

  factory QuizSessionModel.fromJson(Map<String, dynamic> json) {
    return QuizSessionModel(
      sessionId: json["session_id"],
      estimatedDuration: json["estimated_duration"],
      totalQuestions: json["total_questions"],
      firstQuestion: QuestionModel.fromJson(json["question"]),
    );
  }
}