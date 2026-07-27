import 'package:dio/dio.dart';

import '../models/revision_section_model.dart';

abstract class ReviewListRemoteDs {
  Future<ReviewListModel> getReviewList();
  Future<void> deleteReviewChapter(int id);
}

class ReviewListRemoteDsImpl implements ReviewListRemoteDs {
  final Dio dio;

  ReviewListRemoteDsImpl(this.dio);

  @override
  Future<ReviewListModel> getReviewList() async {
    try {
      final response = await dio.get('getReviewList');
print(response.data);
      return ReviewListModel.fromJson(response.data['data']);
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? "Server Error");
    }
  }

  @override
Future<void> deleteReviewChapter(int id) async {
  try {
    await dio.get(
      'removeChapterFromReviewList/$id',
    );
  } on DioException catch (e) {
    throw Exception(
      e.response?.data['message'] ??
          'Delete failed',
    );
  }
}
}
