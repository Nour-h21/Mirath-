import '../entities/notification_entity.dart';
import '../entities/register_device_entity.dart';

abstract class NotificationsRepository {
  Future<RegisterDeviceEntity> registerDevice({
    required String fcmToken,
    required String deviceType,
  });
  
  Future<List<NotificationEntity>> getNotifications();
}