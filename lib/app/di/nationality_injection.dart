import '../../features/signup/data/datasources/nationality_remote_ds.dart';
import '../../features/signup/data/repositories/nationality_repository_impl.dart';

import '../../features/signup/domain/usecase/nationalities_usecase.dart';
import '../../features/signup/presentation/bloc/Nationality/nationality_bloc.dart';

import 'injection_container.dart';

Future<void> initNationalityModule() async {

  getIt.registerLazySingleton<NationalityRemoteDs>(
    () => NationalityRemoteDsImpl(getIt()),
  );

  getIt.registerLazySingleton(
    () => NationalityRepositoryImpl(getIt<NationalityRemoteDs>()),
  );

  getIt.registerLazySingleton(
    () => GetNationalitiesUsecase(getIt<NationalityRepositoryImpl>()),
  );

  getIt.registerFactory(
    () => NationalityBloc(getIt<GetNationalitiesUsecase>()),
  );
}
