import '../../domain/entities/nationality_entity.dart';

class NationalityModel extends NationalityEntity {
  NationalityModel({
    required super.id,
    required super.nationality,
  });

  factory NationalityModel.fromJson(Map<String, dynamic> json) {
    return NationalityModel(
      id: json["id"] ?? 0,
      nationality: json["nationality"] ?? "",
    );
  }
}