import 'package:dio/dio.dart';

import '../../domain/entities/signup_entity.dart';
import '../../domain/repositories/signup_repository.dart';
import '../datasources/signup_remote_ds.dart';

class SignupRepositoryImpl implements SignupRepository {
  final SignupRemoteDs remote;

  SignupRepositoryImpl(this.remote);

  @override
  Future<SignupEntity> signup({
    required String name,
    required String nickName,
    required String email,
    required String password,
    required String confirmPassword,
    required int age,
    required int nationalityId,
  }) async {
    try {
      final body = {
        "name": name,
        "nick_name": nickName,
        "email": email,
        "password": password,
        "password_confirmation": confirmPassword,
        "age": age,
        "nationality_id": nationalityId,
      };

      print("Signup Body => $body");

      return await remote.signup(body);
    } on DioException catch (e) {
      final responseData = e.response?.data;

      String errorMessage = "حدث خطأ غير متوقع";

      // استخراج أول error من API
      if (responseData != null && responseData["errors"] != null) {
        final errors = responseData["errors"];

        if (errors is Map) {
          final firstError = errors.values.first;

          if (firstError is List && firstError.isNotEmpty) {
            errorMessage = firstError.first.toString();
          }
        }
      }

      // إذا ما في errors
      else if (responseData != null &&
          responseData["message"] != null) {
        errorMessage = responseData["message"].toString();
      }

      if (errorMessage ==
          "The email has already been taken.") {
        throw Exception("البريد الإلكتروني مستخدم مسبقاً");
      }

      if (errorMessage ==
          "The email field must be a valid email address.") {
        throw Exception("يرجى إدخال بريد إلكتروني صالح");
      }

      if (errorMessage ==
          "The password field confirmation does not match.") {
        throw Exception("تأكيد كلمة المرور غير متطابق");
      }

      if (errorMessage ==
          "The age field must be at least 12.") {
        throw Exception("يجب أن يكون العمر 12 سنة على الأقل");
      }

      if (errorMessage ==
          "The selected nationality id is invalid.") {
        throw Exception("الجنسية المحددة غير صالحة");
      }

      if (errorMessage ==
          "The name field must be at least 2 characters.") {
        throw Exception("يجب أن يحتوي الاسم على حرفين على الأقل");
      }

      if (errorMessage ==
          "The nick name field must be at least 3 characters.") {
        throw Exception("يجب أن تحتوي الكنية  على 3 أحرف على الأقل");
      }

      // fallback
      throw Exception(errorMessage);
    }
  }
}