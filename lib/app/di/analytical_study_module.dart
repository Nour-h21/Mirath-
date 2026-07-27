import 'package:dio/dio.dart';

import '../../features/analytical_study_page/data/datasources/open_question_remote_ds.dart';
import '../../features/analytical_study_page/data/repositories/open_question_repository_impl.dart';
import '../../features/analytical_study_page/domain/repositories/open_question_repository.dart';
import '../../features/analytical_study_page/domain/usecase/open_question_usecase.dart';
import '../../features/analytical_study_page/presentation/bloc/analytical_study_page_bloc.dart';
import 'injection_container.dart';

Future<void> initAnalyticalStudyModule() async {
  // Bloc
  getIt.registerFactory(() => AnalyticalBloc(getIt<GetOpenQuestionsUseCase>()));

  
  // UseCases
  getIt.registerLazySingleton(
    () => GetOpenQuestionsUseCase(getIt<OpenQuestionRepository>()),
  );

  // Repository
  getIt.registerLazySingleton<OpenQuestionRepository>(
    () => OpenQuestionRepositoryImpl(getIt<OpenQuestionRemoteDataSource>()),
  );

  // DataSource
  getIt.registerLazySingleton<OpenQuestionRemoteDataSource>(
    () => OpenQuestionRemoteDataSourceImpl(getIt<Dio>()),
  );
}
