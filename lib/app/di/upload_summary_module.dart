import '../../features/upload_summary_page/data/datasources/upload_summary_page_remote_ds.dart';
import '../../features/upload_summary_page/data/repositories/upload_summary_page_repository_impl.dart';
import '../../features/upload_summary_page/domain/repositories/upload_summary_page_repository.dart';
import '../../features/upload_summary_page/domain/usecase/book_dropdown_usecase.dart';
import '../../features/upload_summary_page/domain/usecase/chapter_dropdown_usecase.dart';
import '../../features/upload_summary_page/domain/usecase/classification_dropdown_usecase.dart';
import '../../features/upload_summary_page/domain/usecase/upload_summary_page_usecase.dart';
import '../../features/upload_summary_page/presentation/bloc/upload_summary_page_bloc.dart';
import 'injection_container.dart';

Future<void> initUploadSummaryModule() async {
  // Bloc
  getIt.registerFactory<UploadSummaryBloc>(
    () => UploadSummaryBloc(
      getBooks: getIt<GetBooksDropDownUseCase>(),
      getChapters: getIt<GetChaptersDropDownUseCase>(),
      uploadSummary: getIt<UploadSummaryUseCase>(),
      getClassifications: getIt<GetClassificationsDropDownUseCase>(),
    ),
  );
  // UseCases
  getIt.registerLazySingleton<GetClassificationsDropDownUseCase>(
    () => GetClassificationsDropDownUseCase(getIt()),
  );

  getIt.registerLazySingleton<GetBooksDropDownUseCase>(
    () => GetBooksDropDownUseCase(getIt()),
  );

  getIt.registerLazySingleton<GetChaptersDropDownUseCase>(
    () => GetChaptersDropDownUseCase(getIt()),
  );

  getIt.registerLazySingleton<UploadSummaryUseCase>(
    () => UploadSummaryUseCase(getIt()),
  );

  // DataSource
  getIt.registerLazySingleton<UploadSummaryPageRemoteDs>(
    () => UploadSummaryRemoteDataSourceImpl(getIt()),
  );

  // Repository
  getIt.registerLazySingleton<UploadSummaryRepository>(
    () => UploadSummaryRepositoryImpl(getIt()),
  );
}
