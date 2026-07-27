import '../entities/home_entity.dart';
import '../repositories/home_repository.dart';

class GetHomeUseCase {
  final HomeRepository repository;

  GetHomeUseCase(this.repository);

  Future<HomeEntity> call() {
    return repository.getHome();
  }
}