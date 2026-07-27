import '../../features/books_page/data/datasources/books_page_remote_ds.dart';
import '../../features/books_page/data/repositories/books_page_repository_impl.dart';
import '../../features/books_page/domain/repositories/books_page_repository.dart';
import '../../features/books_page/domain/usecase/books_page_usecase.dart';
import '../../features/books_page/presentation/bloc/books_page_bloc.dart';
import 'injection_container.dart';

Future<void> initBooksPageModule() async {
  // Bloc
  getIt.registerFactory(() => BooksBloc(getIt()));

  // UseCases
  getIt.registerLazySingleton(() => GetBooksUseCase(getIt()));

  // Repository
  getIt.registerLazySingleton<BooksRepository>(
    () => BooksRepositoryImpl(getIt()),
  );

  // DataSource

  getIt.registerLazySingleton<BooksRemoteDataSource>(
    () => BooksRemoteDataSourceImpl(getIt()),
  );
}


