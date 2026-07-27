import '../../domain/entities/classification_entity.dart';

class ClassificationModel extends ClassificationEntity {
  ClassificationModel({
    required super.id,
    required super.classification,
  });

  factory ClassificationModel.fromJson(Map<String, dynamic> json) {
    return ClassificationModel(
      id: json["id"],
      classification: json["classification"],
    );
  }
}