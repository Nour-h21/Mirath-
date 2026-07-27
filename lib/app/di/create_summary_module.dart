import '../../features/create_summary_page/data/datasources/create_summary_page_remote_ds.dart';
import '../../features/create_summary_page/data/repositories/create_summary_page_repository_impl.dart';
import '../../features/create_summary_page/domain/repositories/create_summary_page_repository.dart';
import '../../features/create_summary_page/domain/usecase/create_summary_page_usecase.dart';
import '../../features/create_summary_page/presentation/bloc/create_summary_page_bloc.dart';
import 'injection_container.dart';

Future<void> initCreateSummaryModule() async {
  // Bloc
  getIt.registerFactory(() => CreateSummaryBloc(getIt()));

  // UseCases
  getIt.registerLazySingleton(() => AddSummaryUseCase(getIt()));

  // Repository
  getIt.registerLazySingleton<CreateSummaryRepository>(
    () => CreateSummaryRepositoryImpl(getIt()),
  );

  // DataSource

  getIt.registerLazySingleton<CreateSummaryRemoteDataSource>(
    () => CreateSummaryRemoteDataSourceImpl(getIt()),
  );
}
