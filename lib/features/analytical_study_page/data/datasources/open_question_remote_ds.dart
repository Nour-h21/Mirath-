import 'package:dio/dio.dart';

import '../models/open_question_model.dart';

abstract class OpenQuestionRemoteDataSource {
  Future<List<OpenQuestionModel>> getOpenQuestions(int chapterId);
}


class OpenQuestionRemoteDataSourceImpl
    implements OpenQuestionRemoteDataSource {
  final Dio dio;

  OpenQuestionRemoteDataSourceImpl(this.dio);

  @override
  Future<List<OpenQuestionModel>> getOpenQuestions(
      int chapterId) async {
    final response = await dio.get(
      "/getOpenQuestion/$chapterId",
    );

    final List questions =
        response.data["data"]["questions"];

    return questions
        .map((e) => OpenQuestionModel.fromJson(e))
        .toList();
  }
}