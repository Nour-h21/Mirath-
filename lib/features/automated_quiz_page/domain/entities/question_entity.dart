import 'choice_entity.dart';

class QuestionEntity {
  final int id;
  final String questionText;
  final List<ChoiceEntity> choices;

  const QuestionEntity({
    required this.id,
    required this.questionText,
    required this.choices,
  });
}