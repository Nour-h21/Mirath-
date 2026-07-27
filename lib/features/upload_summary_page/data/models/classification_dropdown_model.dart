import '../../domain/entities/classification_dropdown_entity.dart';

class ClassificationDropDownModel extends ClassificationDropDownEntity {
  const ClassificationDropDownModel({required super.id, required super.name});

  factory ClassificationDropDownModel.fromJson(Map<String, dynamic> json) {
    return ClassificationDropDownModel(
      id: json['id'],
      name: json['classification'],
    );
  }
}
