import '../../domain/entities/user_points_entity.dart';
import '../../domain/repositories/user_points_repository.dart';
import '../datasource/user_points_remote_ds.dart';

class UserPointsRepositoryImpl
    implements UserPointsRepository {
  final UserPointsRemoteDS remoteDataSource;

  UserPointsRepositoryImpl(
    this.remoteDataSource,
  );

  @override
  Future<UserPointsEntity> getUserPoints() {
    return remoteDataSource.getUserPoints();
  }
}