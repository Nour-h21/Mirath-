import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:mirath/core/services/firebase_messaging_service.dart';

import '../../core/services/firebase_messaging_service.dart';

import '../../features/notifications/data/datasources/notifications_remote_ds.dart';
import '../../features/notifications/data/repositories/notifications_repository_impl.dart';
import '../../features/notifications/domain/repositories/notifications_repository.dart';
import '../../features/notifications/domain/usecases/get_notifications_use_case.dart';
import '../../features/notifications/domain/usecases/register_device_use_case.dart';
import '../../features/notifications/presentation/bloc/notifications_bloc.dart';
import 'injection_container.dart';

Future<void> initNotificationsModule() async {
  getIt.registerLazySingleton<FirebaseMessaging>(
    () => FirebaseMessaging.instance,
  );

  getIt.registerLazySingleton<FirebaseMessagingService>(
    () => FirebaseMessagingService(getIt<FirebaseMessaging>()),
  );

  getIt.registerLazySingleton<NotificationsRemoteDataSource>(
    () => NotificationsRemoteDataSourceImpl(getIt<Dio>()),
  );

  getIt.registerLazySingleton<NotificationsRepository>(
    () => NotificationsRepositoryImpl(getIt<NotificationsRemoteDataSource>()),
  );

  getIt.registerLazySingleton<RegisterDeviceUseCase>(
    () => RegisterDeviceUseCase(getIt<NotificationsRepository>()),
  );

  getIt.registerLazySingleton<GetNotificationsUseCase>(
  () => GetNotificationsUseCase(
    getIt<NotificationsRepository>(),
  ),
);

 getIt.registerFactory<NotificationsBloc>(
  () => NotificationsBloc(
    registerDeviceUseCase:
        getIt<RegisterDeviceUseCase>(),
    getNotificationsUseCase:
        getIt<GetNotificationsUseCase>(),
    firebaseMessagingService:
        getIt<FirebaseMessagingService>(),
  ),
);
}
