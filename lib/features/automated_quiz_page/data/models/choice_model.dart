import '../../domain/entities/choice_entity.dart';

class ChoiceModel extends ChoiceEntity {
  const ChoiceModel({
    required super.id,
    required super.text,
  });

  factory ChoiceModel.fromJson(Map<String, dynamic> json) {
    return ChoiceModel(
      id: json['id'],
      text: json['choice_text'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "choice_text": text,
    };
  }
}