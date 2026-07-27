import 'package:dio/dio.dart';

import '../models/educational_profile_model.dart';
import '../models/exam_model.dart';

abstract class EducationalProfileRemoteDataSource {
  Future<EducationalProfileModel> getStatistics();
  Future<List<ExamModel>> getLastExams();
  Future<List<ExamModel>> getAllExams();
}

class EducationalProfileRemoteDataSourceImpl
    implements EducationalProfileRemoteDataSource {
  final Dio dio;

  EducationalProfileRemoteDataSourceImpl(this.dio);

  @override
  Future<EducationalProfileModel> getStatistics() async {
    try {
      final response = await dio.get(
        'getStudentStatistics',
      );

      print(response.data);

      return EducationalProfileModel.fromJson(response.data['data']);
    } on DioException catch (e) {
      print("STATUS: ${e.response?.statusCode}");
      print("DATA: ${e.response?.data}");
      print("MESSAGE: ${e.message}");

      throw Exception(e.response?.data?['message'] ?? 'Server Error');
    }
  }

  @override
  Future<List<ExamModel>> getLastExams() async {
    try {
      final response = await dio.get(
        'getLastUserExams',
      );
      print(response.data);

      final List exams = response.data['data'];

      return exams.map((e) => ExamModel.fromJson(e)).toList();
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Server Error');
    }
  }

   @override
  Future<List<ExamModel>> getAllExams() async {
    try {
      final response = await dio.get(
        'getAllUserExams',
      );
      print("All${response.data}");

      final List exams = response.data['data'];

      return exams.map((e) => ExamModel.fromJson(e)).toList();
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Server Error');
    }
  }
}
