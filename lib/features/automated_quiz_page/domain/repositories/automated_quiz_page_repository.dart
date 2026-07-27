import '../entities/quiz_result_entity.dart';
import '../entities/quiz_session_entity.dart';
import '../entities/submit_answer_entity.dart';

abstract class QuizRepository {

  Future<QuizSessionEntity> startQuiz({
    required int chapterId,
  });

  Future<SubmitAnswerEntity> submitAnswer({
    required int sessionId,
    required int questionId,
    required int choiceId,
  });

  Future<QuizResultEntity> endQuiz({
    required int sessionId,
  });

}