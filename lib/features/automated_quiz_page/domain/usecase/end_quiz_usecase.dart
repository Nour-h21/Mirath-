import '../entities/quiz_result_entity.dart';
import '../repositories/automated_quiz_page_repository.dart';

class EndQuizUseCase {

  final QuizRepository repository;

  EndQuizUseCase(this.repository);

  Future<QuizResultEntity> call(int sessionId){

    return repository.endQuiz(
      sessionId: sessionId,
    );

  }

}