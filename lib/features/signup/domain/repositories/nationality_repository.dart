import '../entities/nationality_entity.dart';

abstract class NationalityRepository {
  Future<List<NationalityEntity>> getNationalities();
}