import '../../domain/entities/user_points_entity.dart';

abstract class UserPointsRemoteDS {
  Future<UserPointsEntity> getUserPoints();
}