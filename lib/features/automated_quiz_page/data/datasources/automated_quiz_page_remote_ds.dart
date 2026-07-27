import 'package:dio/dio.dart';

import '../models/quiz_result_model.dart';
import '../models/quiz_session_model.dart';
import '../models/submit_answer_model.dart';

abstract class QuizRemoteDataSource {
  Future<QuizSessionModel> startQuiz(int chapterId);

  Future<SubmitAnswerModel> submitAnswer({
    required int sessionId,

    required int questionId,

    required int choiceId,
  });

  Future<QuizResultModel> endQuiz(int sessionId);
}

class QuizRemoteDataSourceImpl implements QuizRemoteDataSource {
  final Dio dio;

  QuizRemoteDataSourceImpl(this.dio);

  @override
  Future<QuizResultModel> endQuiz(int sessionId) async {
    final response = await dio.get(
      "/endQuiz/$sessionId",
      options: Options(
        headers: {
          "Authorization":
              "Bearer 5|Ze3K8bOfFlF659Ll0BNpnD4T6madFO4ii15iBUG5f1473d24",
        },
      ),
    );

    return QuizResultModel.fromJson(response.data["data"]);
  }

  @override
  Future<SubmitAnswerModel> submitAnswer({
    required int sessionId,

    required int questionId,

    required int choiceId,
  }) async {
    final response = await dio.get(
      "/submitAnswer/$sessionId/$questionId/$choiceId",
      options: Options(
        headers: {
          "Authorization":
              "Bearer 5|Ze3K8bOfFlF659Ll0BNpnD4T6madFO4ii15iBUG5f1473d24",
        },
      ),
    );

    return SubmitAnswerModel.fromJson(response.data["data"]);
  }

  @override
  Future<QuizSessionModel> startQuiz(int chapterId) async {
    final response = await dio.get(
      "/startQuiz/$chapterId",
      options: Options(
        headers: {
          "Authorization":
              "Bearer 5|Ze3K8bOfFlF659Ll0BNpnD4T6madFO4ii15iBUG5f1473d24",
        },
      ),
    );

    return QuizSessionModel.fromJson(response.data["data"]);
  }
}
