import '../entities/user_points_entity.dart';
import '../repositories/user_points_repository.dart';

class GetUserPointsUseCase {
  final UserPointsRepository repository;

  GetUserPointsUseCase(this.repository);

  Future<UserPointsEntity> call() {
    return repository.getUserPoints();
  }
}