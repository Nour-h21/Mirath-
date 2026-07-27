import 'package:dio/dio.dart';

import '../models/chapter_details_model.dart';

abstract class ChapterDetailsRemoteDataSource {
  Future<ChapterDetailsModel> getChapterDetails(int id);

  //UpdateProgress
  Future<void> updateProgress({
    required int chapterId,
    required double progress,
  });
}

class ChapterDetailsRemoteDataSourceImpl
    implements ChapterDetailsRemoteDataSource {
  final Dio dio;

  ChapterDetailsRemoteDataSourceImpl(this.dio);

  @override
  Future<ChapterDetailsModel> getChapterDetails(int id) async {
    final response = await dio.get(
      '/getChapterDetails/$id',
      options: Options(
        headers: {
          "Authorization":
              "Bearer 5|Ze3K8bOfFlF659Ll0BNpnD4T6madFO4ii15iBUG5f1473d24",
        },
      ),
    );
    return ChapterDetailsModel.fromJson(response.data);
  }

  //UpdateProgress
  
  @override
  Future<void> updateProgress({
    required int chapterId,
    required double progress,
  }) async {
    await dio.post(
      "/updateProgress/$chapterId",
      data: {"progress": progress},
      options: Options(
        headers: {
          "Authorization":
              "Bearer 5|Ze3K8bOfFlF659Ll0BNpnD4T6madFO4ii15iBUG5f1473d24",
        },
      ),
    );
  }
}
