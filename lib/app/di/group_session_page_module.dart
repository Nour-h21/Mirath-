import 'package:dio/dio.dart';

import '../../features/group_session_page/data/datasources/meeting_remote_ds.dart';
import '../../features/group_session_page/data/repositories/meeting_repository_impl.dart';
import '../../features/group_session_page/domain/repositories/meeting_repository.dart';
import '../../features/group_session_page/domain/usecase/meeting_usecase.dart';
import '../../features/group_session_page/presentation/bloc/meeting_bloc.dart';
import 'injection_container.dart';

Future<void> initGroupSessionPageModule() async {
  getIt.registerLazySingleton<MeetingRemoteDataSource>(
    () => MeetingRemoteDataSourceImpl(dio:getIt<Dio>()),
  );

  getIt.registerLazySingleton<MeetingRepository>(
    () => MeetingRepositoryImpl(remoteDataSource: getIt()),
  );

  getIt.registerLazySingleton<CreateMeetingUseCase>(
    () => CreateMeetingUseCase(repository: getIt()),
  );
   getIt.registerLazySingleton<JoinMeetingUseCase>(
    () => JoinMeetingUseCase(repository: getIt()),
  );

  getIt.registerFactory<MeetingBloc>(
    () => MeetingBloc(createMeetingUseCase: getIt(), joinMeetingUseCase: getIt()),
  );
}
