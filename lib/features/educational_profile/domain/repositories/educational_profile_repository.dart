import '../entities/educational_profile_entity.dart';
import '../entities/exam_entity.dart';


abstract class EducationalProfileRepository {
  Future<EducationalProfileEntity> getStatistics();
  Future<List<ExamEntity>> getLastExams();
  Future<List<ExamEntity>> getAllExams();
}


