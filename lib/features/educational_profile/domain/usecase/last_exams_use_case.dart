import '../entities/exam_entity.dart';
import '../repositories/educational_profile_repository.dart';


class GetLastExamsUseCase {
  final EducationalProfileRepository repository;

  GetLastExamsUseCase(this.repository);

  Future<List<ExamEntity>> call() {
    return repository.getLastExams();
  }
}