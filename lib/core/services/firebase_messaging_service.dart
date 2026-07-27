import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseMessagingService {
  final FirebaseMessaging _messaging;

  FirebaseMessagingService(this._messaging);

  Future<String?> getToken() async {
    await _messaging.requestPermission();

    return await _messaging.getToken();
  }

  Stream<String> get onTokenRefresh {
    return _messaging.onTokenRefresh;
  }

  // التطبيق مفتوح
  Stream<RemoteMessage> get onMessage {
    return FirebaseMessaging.onMessage;
  }

  // المستخدم ضغط على الإشعار والتطبيق كان بالخلفية
  Stream<RemoteMessage> get onMessageOpenedApp {
    return FirebaseMessaging.onMessageOpenedApp;
  }

  // التطبيق كان مغلقاً بالكامل والمستخدم ضغط على الإشعار
  Future<RemoteMessage?> getInitialMessage() {
    return _messaging.getInitialMessage();
  }
}