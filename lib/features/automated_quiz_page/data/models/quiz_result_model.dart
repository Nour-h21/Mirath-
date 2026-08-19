import '../../domain/entities/quiz_result_entity.dart';

class QuizResultModel extends QuizResultEntity {
  QuizResultModel({
    required super.success,
    required super.correctAnswers,
    required super.percentage,
    required super.newPoints,
    required super.totalPoints,
    required super.totalQuestions,
  });

  factory QuizResultModel.fromJson(Map<String, dynamic> json) {
    return QuizResultModel(
      success: json["success"],
      correctAnswers: json["correct_answers"],
      percentage: json["correct_answers_pricent"],
      newPoints: json["new_points"],
      totalPoints: json["all_user_points"],
      totalQuestions: json["total_questions"] ?? 0,
    );
  }
}
