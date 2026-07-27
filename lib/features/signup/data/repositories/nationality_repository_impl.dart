import '../../domain/entities/nationality_entity.dart';
import '../../domain/repositories/nationality_repository.dart';
import '../datasources/nationality_remote_ds.dart';

class NationalityRepositoryImpl
    implements NationalityRepository {
  final NationalityRemoteDs remote;

  NationalityRepositoryImpl(this.remote);

  @override
  Future<List<NationalityEntity>> getNationalities() async {
    return await remote.getNationalities();
  }
}