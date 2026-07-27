import '../../features/one_book/data/datasources/one_book_page_remote_ds.dart';
import '../../features/one_book/data/repositories/one_book_page_repository_impl.dart';
import '../../features/one_book/domain/repositories/one_book_page_repository.dart';
import '../../features/one_book/domain/usecase/one_book_page_usecase.dart';
import '../../features/one_book/presentation/bloc/one_book_bloc.dart';
import '../../features/one_book/presentation/helper/bookmark_helper.dart';
import 'injection_container.dart';

Future<void> initOneBookPageModule() async {
  // Bloc
  getIt.registerFactory(() => BookDetailsBloc(getIt()));

  // UseCases
  getIt.registerLazySingleton(() => GetBookDetailsUseCase(getIt()));

  // Repository
  getIt.registerLazySingleton<BookDetailsRepository>(
    () => BookDetailsRepositoryImpl(getIt()),
  );

  // DataSource
  getIt.registerLazySingleton<BookDetailsRemoteDataSource>(
    () => BookDetailsRemoteDataSourceImpl(getIt()),
  );

  // BookMark
  getIt.registerLazySingleton(() => BookmarkHelper(getIt()));
}
