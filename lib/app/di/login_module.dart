import 'package:mirath/app/di/injection_container.dart';
import 'package:mirath/features/login/data/datasources/login_remote_ds.dart';
import 'package:mirath/features/login/data/repositories/login_repository_impl.dart';
import 'package:mirath/features/login/domain/repositories/login_repository.dart';

import '../../features/login/domain/usecase/google_login_usecase.dart';
import '../../features/login/domain/usecase/login_usecase.dart';
import '../../features/login/presentation/bloc/login_bloc.dart';

Future<void> initLoginModule() async {
  // Bloc
  getIt.registerFactory(
    () => LoginBloc(getIt<LoginUseCase>(), getIt<GoogleLoginUseCase>()),
  );

  // UseCases
  getIt.registerLazySingleton(() => LoginUseCase(getIt()));

  getIt.registerLazySingleton(() => GoogleLoginUseCase(getIt()));

  // Repository
  getIt.registerLazySingleton<LoginRepository>(
    () => LoginRepositoryImpl(getIt()),
  );

  // DataSource
  getIt.registerLazySingleton<LoginRemoteDs>(() => LoginRemoteDsImpl(getIt()));
}
