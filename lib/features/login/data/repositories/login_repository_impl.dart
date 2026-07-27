import '../../domain/entities/login_entity.dart';
import '../../domain/repositories/login_repository.dart';
import '../datasources/login_remote_ds.dart';

class LoginRepositoryImpl extends LoginRepository {
  final LoginRemoteDs remoteDataSource;

  LoginRepositoryImpl(this.remoteDataSource);

  @override
  Future<LoginEntity> login({
    required String email,
    required String password,
  }) async {
    return await remoteDataSource.login(email: email, password: password);
  }

  @override
  Future<LoginEntity> loginWithGoogle() async {
    return await remoteDataSource.loginWithGoogle();
  }
}
