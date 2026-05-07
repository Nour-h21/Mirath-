import '../repositories/change_password_repository.dart';
import '../entities/forgot_password_entity.dart';

class ForgotPasswordUsecase {
  final ChangePasswordRepository repository;

  ForgotPasswordUsecase(this.repository);

  Future<ForgotPasswordEntity> call({
    required String email,
  }) async {
    print("nnnnnnnnn$email");
    return await repository.forgotPassword(
      email: email,
    );
  
  }
}
