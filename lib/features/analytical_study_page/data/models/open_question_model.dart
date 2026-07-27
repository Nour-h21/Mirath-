import '../../domain/entities/open_question_entity.dart';

class OpenQuestionModel extends OpenQuestionEntity {
  const OpenQuestionModel({
    required super.id,
    required super.questionText,
    required super.answer,
  });

  factory OpenQuestionModel.fromJson(Map<String, dynamic> json) {
    return OpenQuestionModel(
      id: json["id"],
      questionText: json["question_text"],
      answer: json["answer"],
    );
  }
}