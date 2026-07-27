import 'package:get_it/get_it.dart';

import '../../features/cart/data/datasources/cart_remote_ds.dart';
import '../../features/cart/data/repositories/cart_repository_impl.dart';
import '../../features/cart/domain/repositories/cart_repository.dart';
import '../../features/cart/domain/usecases/get_cart_usecase.dart';
import '../../features/cart/domain/usecases/redeem_books_use_case.dart';
import '../../features/cart/presentation/bloc/cart/cart_bloc.dart';

final getIt = GetIt.instance;

Future<void> initCartModule() async {

  /// DataSource
  if (!getIt.isRegistered<CartRemoteDataSource>()) {
    getIt.registerLazySingleton<CartRemoteDataSource>(
      () => CartRemoteDataSourceImpl(getIt()),
    );
  }

  /// Repository
  if (!getIt.isRegistered<CartRepository>()) {
    getIt.registerLazySingleton<CartRepository>(
      () => CartRepositoryImpl(getIt()),
    );
  }

  /// UseCase
  if (!getIt.isRegistered<GetCartUseCase>()) {
    getIt.registerLazySingleton<GetCartUseCase>(
      () => GetCartUseCase(getIt()),
    );
  }

  if (!getIt.isRegistered<RedeemCartUseCase>()) {
    getIt.registerLazySingleton<RedeemCartUseCase>(
      () => RedeemCartUseCase(getIt()),
    );
  }

  /// Bloc
  if (!getIt.isRegistered<CartBloc>()) {
    getIt.registerFactory(
      () => CartBloc(
        getIt<GetCartUseCase>(),
         getIt<RedeemCartUseCase>(),
      ),
    );
  }
}