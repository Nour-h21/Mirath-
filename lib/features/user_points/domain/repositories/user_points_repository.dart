import '../entities/user_points_entity.dart';

abstract class UserPointsRepository {
  Future<UserPointsEntity> getUserPoints();
}