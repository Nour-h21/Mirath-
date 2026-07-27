
import '../../features/user_points/data/datasource/user_points_remote_ds.dart';
import '../../features/user_points/data/datasource/user_points_remote_ds_impl.dart';
import '../../features/user_points/data/repositories/user_points_repository_impl.dart';
import '../../features/user_points/domain/repositories/user_points_repository.dart';
import '../../features/user_points/domain/usecases/get_user_points_usecase.dart';
import '../../features/user_points/presentation/bloc/user_points_bloc.dart';
import 'cart_module.dart';

Future<void> initUserPointsModule() async {

  /// DataSource
  getIt.registerLazySingleton<UserPointsRemoteDS>(
    () => UserPointsRemoteDataSourceImpl(
      getIt(),
    ),
  );

  /// Repository
  getIt.registerLazySingleton<UserPointsRepository>(
    () => UserPointsRepositoryImpl(
      getIt(),
    ),
  );

  /// UseCase
  getIt.registerLazySingleton<GetUserPointsUseCase>(
    () => GetUserPointsUseCase(
      getIt(),
    ),
  );

  /// Bloc
  getIt.registerFactory(
    () => UserPointsBloc(
      getIt(),
    ),
  );
}