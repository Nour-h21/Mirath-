import '../../features/feedback_page/data/datasources/feedback_remote_ds.dart';
import '../../features/feedback_page/data/repositories/feedback_repository_impl.dart';
import '../../features/feedback_page/domain/repositories/feedback_repository.dart';
import '../../features/feedback_page/domain/usecase/feedback_usecase.dart';
import '../../features/feedback_page/presentation/bloc/feedback_bloc.dart';
import 'injection_container.dart';

Future<void> initFeedBackPageModule() async {
  getIt.registerLazySingleton<FeedbackRemoteDataSource>(
    () => FeedbackRemoteDataSourceImpl(getIt()),
  );

  getIt.registerLazySingleton<FeedbackRepository>(
    () => FeedbackRepositoryImpl(getIt<FeedbackRemoteDataSource>()),
  );

  getIt.registerLazySingleton<AddFeedbackUseCase>(
    () => AddFeedbackUseCase(getIt<FeedbackRepository>()),
  );

  getIt.registerFactory<FeedbackBloc>(
    () => FeedbackBloc(getIt<AddFeedbackUseCase>()),
  );
}
