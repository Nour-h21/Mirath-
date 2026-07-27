import '../../features/home/data/datasources/home_remote_ds.dart';
import '../../features/home/data/repositories/home_repository_impl.dart';
import '../../features/home/domain/repositories/home_repository.dart';
import '../../features/home/domain/usecase/home_usecase.dart';
import '../../features/home/presentation/bloc/home_bloc.dart';
import 'injection_container.dart';

Future<void> initHomePageModule() async {
  // Bloc
  getIt.registerFactory(() => HomeBloc(getIt()));

  // UseCases
  getIt.registerLazySingleton(() => GetHomeUseCase(getIt()));

  // Repository
  getIt.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(getIt()),
  );

  // DataSource
  getIt.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(getIt()),
  );
}
