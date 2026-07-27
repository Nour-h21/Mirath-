import '../entities/educational_profile_entity.dart';
import '../repositories/educational_profile_repository.dart';

class GetEducationalProfileUseCase {
  final EducationalProfileRepository repository;

  GetEducationalProfileUseCase(this.repository);

  Future<EducationalProfileEntity> call() {
    return repository.getStatistics();
  }
}