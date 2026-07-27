import '../../features/awards/data/datasources/awards_remote_ds.dart';
import '../../features/awards/data/repositories/awards_repository_impl.dart';
import '../../features/awards/domain/repositories/awards_repository.dart';
import '../../features/awards/domain/usecases/add_book_to_cart_usecase.dart';
import '../../features/awards/domain/usecases/library_books_use_case.dart';
import '../di/injection_container.dart';

import '../../features/awards/presentation/bloc/awards_bloc.dart';

Future<void> initAwardsModule() async {

  /// DataSource
  getIt.registerLazySingleton<AwardsRemoteDataSource>(
    () => AwardsRemoteDataSourceImpl(
      getIt(),
    ),
  );

  /// Repository
  getIt.registerLazySingleton<AwardsRepository>(
    () => AwardsRepositoryImpl(
      getIt(),
    ),
  );

  /// UseCase
  getIt.registerLazySingleton<GetLibraryBooksUseCase>(
    () => GetLibraryBooksUseCase(
      getIt(),
    ),
  );

  getIt.registerLazySingleton<AddBookToCartUseCase>(
  () => AddBookToCartUseCase(
    getIt(),
  ),
);

  /// Bloc
  getIt.registerFactory(
  () => AwardsBloc(
    getIt<GetLibraryBooksUseCase>(),
    getIt<AddBookToCartUseCase>(),
  ),
);
}