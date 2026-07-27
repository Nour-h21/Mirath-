import '../../../domain/entities/educational_profile_entity.dart';
import '../../../domain/entities/exam_entity.dart';

abstract class EducationalProfileState {}

class EducationalProfileInitial
    extends EducationalProfileState {}

class EducationalProfileLoading
    extends EducationalProfileState {}

class EducationalProfileLoaded extends EducationalProfileState {
  final EducationalProfileEntity statistics;
  final List<ExamEntity> lastExams;
  final List<ExamEntity> allExams;

  EducationalProfileLoaded({
    required this.statistics,
    required this.lastExams,
    required this.allExams,
  });
}

class EducationalProfileError
    extends EducationalProfileState {

  final String message;

  EducationalProfileError(this.message);
}