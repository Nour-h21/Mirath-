import 'package:mirath/features/login/domain/entities/login_entity.dart';
import 'package:mirath/features/login/domain/repositories/login_repository.dart';



class GoogleLoginUseCase {

  final LoginRepository repository;

  GoogleLoginUseCase(this.repository);

  Future<LoginEntity> call() async {

    return await repository.loginWithGoogle();
  }
}