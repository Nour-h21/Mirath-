import '../../domain/entities/notification_entity.dart';
import '../../domain/entities/register_device_entity.dart';
import '../../domain/repositories/notifications_repository.dart';
import '../datasources/notifications_remote_ds.dart';


class NotificationsRepositoryImpl implements NotificationsRepository {
  final NotificationsRemoteDataSource remoteDataSource;

  NotificationsRepositoryImpl(this.remoteDataSource);

  @override
  Future<RegisterDeviceEntity> registerDevice({
    required String fcmToken,
    required String deviceType,
  }) async {
    return await remoteDataSource.registerDevice(
      fcmToken: fcmToken,
      deviceType: deviceType,
    );
  }

  @override
Future<List<NotificationEntity>> getNotifications() async {
  return await remoteDataSource.getNotifications();
}
}