
import '../../features/revision_section/date/datasources/revision_section_remote_ds.dart';
import '../../features/revision_section/date/repositories/revision_section_repository_impl.dart';
import '../../features/revision_section/domain/repositories/revision_section_repository.dart';
import '../../features/revision_section/domain/usecase/delete_review_chapter_use_case.dart';
import '../../features/revision_section/domain/usecase/revision_section_use_case.dart';
import '../../features/revision_section/presentation/bloc/revision_section_bloc.dart';
import 'injection_container.dart';

Future<void> initReviewListModule() async {
// DataSource
getIt.registerLazySingleton<ReviewListRemoteDs>(
  () => ReviewListRemoteDsImpl(getIt()),
);

// Repository
getIt.registerLazySingleton<ReviewListRepository>(
  () => ReviewListRepositoryImpl(getIt()),
);

// UseCase
getIt.registerLazySingleton<GetReviewListUseCase>(
  () => GetReviewListUseCase(getIt()),
);

getIt.registerLazySingleton<DeleteReviewChapterUseCase>(
  () => DeleteReviewChapterUseCase(getIt()),
);

// Bloc
getIt.registerFactory(
  () => ReviewListBloc(
    getIt<GetReviewListUseCase>(),
    getIt<DeleteReviewChapterUseCase>(),
  ),
);
}