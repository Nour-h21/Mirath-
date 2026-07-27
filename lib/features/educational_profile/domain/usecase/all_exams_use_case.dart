import '../entities/exam_entity.dart';
import '../repositories/educational_profile_repository.dart';

class GetAllExamsUseCase {
  final EducationalProfileRepository repository;

  GetAllExamsUseCase(this.repository);

  Future<List<ExamEntity>> call() {
    return repository.getAllExams();
  }
}