import 'package:dio/dio.dart';

abstract class FeedbackRemoteDataSource {
  Future<String> addFeedback({
    required String feedback,
  });
}

class FeedbackRemoteDataSourceImpl
    implements FeedbackRemoteDataSource {
  final Dio dio;

  FeedbackRemoteDataSourceImpl(this.dio);

  @override
  Future<String> addFeedback({
    required String feedback,
  }) async {
    final response = await dio.post(
      '/addFeedback',
      data: {
        'feedback': feedback,
      },
    );

    return response.data['message'] ?? '';
  }
}