import '../../domain/entities/educational_profile_entity.dart';
import '../../domain/entities/exam_entity.dart';
import '../../domain/repositories/educational_profile_repository.dart';
import '../datasources/educational_profile_remote_ds.dart';


class EducationalProfileRepositoryImpl
    implements EducationalProfileRepository {

  final EducationalProfileRemoteDataSource remote;

  EducationalProfileRepositoryImpl(this.remote);

  @override
  Future<EducationalProfileEntity> getStatistics() {
    return remote.getStatistics();
  }

  @override
Future<List<ExamEntity>> getLastExams() {
  return remote.getLastExams();
}

@override
Future<List<ExamEntity>> getAllExams() {
  return remote.getAllExams();
}
}