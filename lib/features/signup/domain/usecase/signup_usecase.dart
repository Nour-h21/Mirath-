import '../repositories/signup_repository.dart';
import '../entities/signup_entity.dart';

class SignupUsecase {
  final SignupRepository repository;

  SignupUsecase(this.repository);

  Future<SignupEntity> call({
    required String name,
    required String nickName,
    required String email,
    required String password,
    required String confirmPassword,
    required int age,
    required int nationalityId,
  }) async {
    return await repository.signup(
      name: name,
      nickName: nickName,
      email: email,
      password: password,
      confirmPassword: confirmPassword,
      age: age,
      nationalityId: nationalityId,
    );
  }
}