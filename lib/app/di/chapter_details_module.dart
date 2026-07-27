import 'package:mirath/app/di/injection_container.dart';

import '../../features/chapter_details_page/data/datasources/chapter_details_remote_ds.dart';
import '../../features/chapter_details_page/data/repositories/chapter_details_repository_impl.dart';
import '../../features/chapter_details_page/domain/repositories/chapter_details_repository.dart';
import '../../features/chapter_details_page/domain/usecase/chapter_details_usecase.dart';
import '../../features/chapter_details_page/presentation/bloc/chapter_details_bloc.dart';

Future<void> initOneChapterDetailsModule() async {
  // Bloc
  getIt.registerFactory(() => ChapterDetailsBloc(getIt(), getIt()));

  // UseCases
  getIt.registerLazySingleton(() => GetChapterDetailsUseCase(getIt()));

  // Repository
  getIt.registerLazySingleton<ChapterDetailsRepository>(
    () => ChapterDetailsRepositoryImpl(getIt()),
  );

  // DataSource
  getIt.registerLazySingleton<ChapterDetailsRemoteDataSource>(
    () => ChapterDetailsRemoteDataSourceImpl(getIt()),
  );
  
  //UpdateProgress
  getIt.registerLazySingleton(() => UpdateProgressUseCase(getIt()));
}
