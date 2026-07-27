import '../../domain/entities/question_entity.dart';
import 'choice_model.dart';

class QuestionModel extends QuestionEntity {
  QuestionModel({
    required super.id,
    required super.questionText,
    required super.choices,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      id: json["id"],
      questionText: json["question_text"],
      choices: (json["choices"] as List)
          .map((e) => ChoiceModel.fromJson(e))
          .toList(),
    );
  }
}