import '../../domain/entities/notification_entity.dart';
import '../../domain/entities/register_device_entity.dart';

abstract class NotificationsState {}

class NotificationsInitial extends NotificationsState {}

class NotificationsLoading extends NotificationsState {}

class DeviceRegisteredSuccess extends NotificationsState {
  final RegisterDeviceEntity data;

  DeviceRegisteredSuccess(this.data);
}

class NotificationsError extends NotificationsState {
  final String message;

  NotificationsError(this.message);
}

class NotificationsLoaded
    extends NotificationsState {
  final List<NotificationEntity> notifications;

  NotificationsLoaded(this.notifications);
}