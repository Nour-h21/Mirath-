import '../entities/nationality_entity.dart';
import '../repositories/nationality_repository.dart';

class GetNationalitiesUsecase {
  final NationalityRepository repository;

  GetNationalitiesUsecase(this.repository);

  Future<List<NationalityEntity>> call() async {
    return await repository.getNationalities();
  }
}