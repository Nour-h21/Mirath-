import '../entities/submit_answer_entity.dart';
import '../repositories/automated_quiz_page_repository.dart';

class SubmitAnswerUseCase {

  final QuizRepository repository;

  SubmitAnswerUseCase(this.repository);

  Future<SubmitAnswerEntity> call({

    required int sessionId,

    required int questionId,

    required int choiceId,

  }){

    return repository.submitAnswer(

      sessionId: sessionId,

      questionId: questionId,

      choiceId: choiceId,

    );

  }

}