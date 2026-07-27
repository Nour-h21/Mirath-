import 'package:mirath/app/di/injection_container.dart';

import '../../features/automated_quiz_page/data/datasources/automated_quiz_page_remote_ds.dart';
import '../../features/automated_quiz_page/data/repositories/automated_quiz_page_repository_impl.dart';
import '../../features/automated_quiz_page/domain/repositories/automated_quiz_page_repository.dart';
import '../../features/automated_quiz_page/domain/usecase/end_quiz_usecase.dart';
import '../../features/automated_quiz_page/domain/usecase/start_quiz_usecase.dart';
import '../../features/automated_quiz_page/domain/usecase/submit_answer_usecase.dart';
import '../../features/automated_quiz_page/presentation/bloc/automated_quiz_page_bloc.dart';

Future<void> initAutomatedQuizModule() async {
  // Bloc
  getIt.registerFactory(() => QuizBloc(getIt(), getIt(), getIt()));

  // UseCases
  getIt.registerLazySingleton(() => StartQuizUseCase(getIt()));

  getIt.registerLazySingleton(() => SubmitAnswerUseCase(getIt()));

  getIt.registerLazySingleton(() => EndQuizUseCase(getIt()));

  // Repository
  getIt.registerLazySingleton<QuizRepository>(
    () => QuizRepositoryImpl(getIt()),
  );

  // DataSource
  getIt.registerLazySingleton<QuizRemoteDataSource>(
    () => QuizRemoteDataSourceImpl(getIt()),
  );
}
