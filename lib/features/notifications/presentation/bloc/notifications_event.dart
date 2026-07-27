import 'package:firebase_messaging/firebase_messaging.dart';

abstract class NotificationsEvent {}

class RegisterCurrentDeviceEvent extends NotificationsEvent {}

// class RegisterDeviceEvent extends NotificationsEvent {
//   final String fcmToken;
//   final String deviceType;

//   RegisterDeviceEvent({
//     required this.fcmToken,
//     required this.deviceType,
//   });
// }
class NotificationReceivedEvent
    extends NotificationsEvent {
  final RemoteMessage message;

  NotificationReceivedEvent(this.message);
}

class GetNotificationsEvent
    extends NotificationsEvent {}