import '../../domain/entities/user_points_entity.dart';

class UserPointsModel extends UserPointsEntity {
  const UserPointsModel({
    required super.points,
  });

  factory UserPointsModel.fromJson(Map<String, dynamic> json) {
    return UserPointsModel(
      points: json["points"] ?? 0,
    );
  }
}