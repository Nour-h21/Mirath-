
import 'package:dio/dio.dart';

import '../models/book_dropdown_model.dart';
import '../models/chapter_dropdown_model.dart';
import '../models/classification_dropdown_model.dart';

abstract class UploadSummaryPageRemoteDs {
  Future<List<ClassificationDropDownModel>> getClassifications();

  Future<List<BookDropDownModel>> getBooks(int classificationId);

  Future<List<ChapterDropDownModel>> getChapters(int bookId);

  Future<void> uploadSummary(int chapterId, String path);
}

class UploadSummaryRemoteDataSourceImpl implements UploadSummaryPageRemoteDs {
  final Dio dio;

  UploadSummaryRemoteDataSourceImpl(this.dio);

  @override
  Future<List<ClassificationDropDownModel>> getClassifications() async {
    final response = await dio.get('/getClassifications');

    final List data = response.data['data'];

    return data.map((e) => ClassificationDropDownModel.fromJson(e)).toList();
  }

  @override
  Future<List<BookDropDownModel>> getBooks(int classificationId) async {
    final response = await dio.get('/getBooks/$classificationId');

    final List data = response.data['data'];

    return data.map((e) => BookDropDownModel.fromJson(e)).toList();
  }

  @override
  Future<List<ChapterDropDownModel>> getChapters(int bookId) async {
    final response = await dio.get('/getChapters/$bookId');

    final List data = response.data['data'];

    return data.map((e) => ChapterDropDownModel.fromJson(e)).toList();
  }

  @override
  Future<void> uploadSummary(int chapterId, String path) async {
    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(
        path,
        filename: path.split('/').last,
      ),
    });

    await dio.post(
      '/uploadSummary/$chapterId',

      data: formData,

      options: Options(contentType: 'multipart/form-data'),
    );
  }
}
