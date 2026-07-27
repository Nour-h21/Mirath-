import '../entities/quiz_session_entity.dart';
import '../repositories/automated_quiz_page_repository.dart';

class StartQuizUseCase {

  final QuizRepository repository;

  StartQuizUseCase(this.repository);

  Future<QuizSessionEntity> call(int chapterId){

    return repository.startQuiz(
      chapterId: chapterId,
    );

  }

}