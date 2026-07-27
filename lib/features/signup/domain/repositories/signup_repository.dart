import '../entities/signup_entity.dart';

abstract class SignupRepository {
  Future<SignupEntity> signup({
    required String name,
    required String nickName,
    required String email,
    required String password,
    required String confirmPassword,
    required int age,
    required int nationalityId,
  });
}