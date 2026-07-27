import 'package:mirath/app/di/injection_container.dart';

import '../../features/my_summary_page/data/datasources/my_summary_page_remote_ds.dart';
import '../../features/my_summary_page/data/repositories/my_summary_page_repository_impl.dart';
import '../../features/my_summary_page/domain/repositories/my_summary_page_repository.dart';
import '../../features/my_summary_page/domain/usecase/delete_summary_usecase.dart';
import '../../features/my_summary_page/domain/usecase/external_summary_usecase.dart';
import '../../features/my_summary_page/domain/usecase/internal_summary_usecase.dart';
import '../../features/my_summary_page/presentation/bloc/my_summary_page_bloc.dart';

Future<void> initMySummaryModule() async {
  // Bloc
  getIt.registerFactory(
    () => MySummaryBloc(
      getIt<GetInternalSummariesUseCase>(),
      getIt<GetExternalSummariesUseCase>(),
      getIt<DeleteSummaryUseCase>(),
    ),
  );

  // UseCases
  getIt.registerLazySingleton(
    () => GetInternalSummariesUseCase(getIt<MySummaryRepository>()),
  );

  getIt.registerLazySingleton(
    () => GetExternalSummariesUseCase(getIt<MySummaryRepository>()),
  );

  // Repository
  getIt.registerLazySingleton<MySummaryRepository>(
    () => MySummaryRepositoryImpl(getIt()),
  );

  // DataSource
  getIt.registerLazySingleton<MySummaryRemoteDatasource>(
    () => MySummaryRemoteDatasourceImpl(getIt()),
  );

  // Delete
  getIt.registerLazySingleton(() => DeleteSummaryUseCase(getIt()));
}
