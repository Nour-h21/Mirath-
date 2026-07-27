import '../../features/summary_details_page/data/datasources/summary_details_remote_ds.dart';
import '../../features/summary_details_page/data/repositories/summary_details_repository_impl.dart';
import '../../features/summary_details_page/domain/repositories/summary_details_repository.dart';
import '../../features/summary_details_page/domain/usecase/summary_details_usecase.dart';
import '../../features/summary_details_page/domain/usecase/summary_edit_usecase.dart';
import '../../features/summary_details_page/presentation/bloc/summary_details_bloc.dart';
import 'injection_container.dart';

Future<void> initSummaryDetailsModule() async {
  // Bloc
  getIt.registerFactory(() => SummaryDetailsBloc(getIt(),getIt()));

  // UseCases SummaryDetails
  getIt.registerLazySingleton(() => GetSummaryDetailsUseCase(getIt()));

  // UseCases SummaryEdit
  getIt.registerLazySingleton(() => EditSummaryDetailsUseCase(getIt()));

  // DataSource
  getIt.registerLazySingleton<SummaryDetailsRemoteDataSource>(
    () => SummaryDetailsRemoteDataSourceImpl(getIt()),
  );

  // Repository
  getIt.registerLazySingleton<SummaryDetailsRepository>(
    () => SummaryDetailsRepositoryImpl(getIt()),
  );
}
