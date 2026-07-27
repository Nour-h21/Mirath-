import 'package:dio/dio.dart';

import '../models/create_summary_page_model.dart';

abstract class CreateSummaryRemoteDataSource {
  Future<String> addSummary({
    required int chapterId,
    required CreateSummaryModel model,
  });
}

class CreateSummaryRemoteDataSourceImpl
    implements CreateSummaryRemoteDataSource {
  final Dio dio;

  CreateSummaryRemoteDataSourceImpl(this.dio);

  @override
  Future<String> addSummary({
    required int chapterId,
    required CreateSummaryModel model,
  }) async {
    final response = await dio.post(
      "/addSummary/$chapterId",
      data: model.toJson(),
      options: Options(
        headers: {
          "Authorization":
              "Bearer 5|Ze3K8bOfFlF659Ll0BNpnD4T6madFO4ii15iBUG5f1473d24",
        },
      ),
    );
    try {} on DioException catch (e) {
      if (e.response?.statusCode == 422) {
        throw Exception(
          e.response?.data["message"] ?? "يوجد ملخص سابق لهذا الباب",
        );
      }

      throw Exception("حدث خطأ غير متوقع");
    }

    return response.data["message"];
  }
}
