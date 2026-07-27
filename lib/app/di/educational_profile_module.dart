import '../../../app/di/injection_container.dart';
import '../../features/educational_profile/data/datasources/educational_profile_remote_ds.dart';
import '../../features/educational_profile/data/repositories/educational_profile_repository_impl.dart';
import '../../features/educational_profile/domain/repositories/educational_profile_repository.dart';
import '../../features/educational_profile/domain/usecase/all_exams_use_case.dart';
import '../../features/educational_profile/domain/usecase/educational_profile_usecase.dart';
import '../../features/educational_profile/domain/usecase/last_exams_use_case.dart';
import '../../features/educational_profile/presentation/bloc/bloc/educational_profile_bloc.dart';

Future<void> initEducationalProfileModule() async {

// DataSource
getIt.registerLazySingleton<EducationalProfileRemoteDataSource>(
  () => EducationalProfileRemoteDataSourceImpl(getIt()),
);

// Repository
getIt.registerLazySingleton<EducationalProfileRepository>(
  () => EducationalProfileRepositoryImpl(getIt()),
);

// UseCases
getIt.registerLazySingleton<GetEducationalProfileUseCase>(
  () => GetEducationalProfileUseCase(getIt()),
);

getIt.registerLazySingleton<GetLastExamsUseCase>(
  () => GetLastExamsUseCase(getIt()),
);

getIt.registerLazySingleton<GetAllExamsUseCase>(
  () => GetAllExamsUseCase(getIt()),
);

// Bloc
getIt.registerFactory(
  () => EducationalProfileBloc(
    getIt<GetEducationalProfileUseCase>(),
    getIt<GetLastExamsUseCase>(),
    getIt<GetAllExamsUseCase>(),
  ),
);
}