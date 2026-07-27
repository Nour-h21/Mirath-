import '../../domain/entities/quiz_result_entity.dart';
import '../../domain/entities/quiz_session_entity.dart';
import '../../domain/entities/submit_answer_entity.dart';
import '../../domain/repositories/automated_quiz_page_repository.dart';
import '../datasources/automated_quiz_page_remote_ds.dart';

class QuizRepositoryImpl implements QuizRepository {
  final QuizRemoteDataSource remote;

  QuizRepositoryImpl(this.remote);
  @override
  Future<QuizSessionEntity> startQuiz({required int chapterId}) {
    return remote.startQuiz(chapterId);
  }

  @override
  Future<SubmitAnswerEntity> submitAnswer({
    required int sessionId,

    required int questionId,

    required int choiceId,
  }) {
    return remote.submitAnswer(
      sessionId: sessionId,

      questionId: questionId,

      choiceId: choiceId,
    );
  }

  @override
  Future<QuizResultEntity> endQuiz({required int sessionId}) {
    return remote.endQuiz(sessionId);
  }
}
