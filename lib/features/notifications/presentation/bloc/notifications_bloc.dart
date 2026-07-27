// import 'dart:io';

// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../../core/services/firebase_messaging_service.dart';
// import '../../domain/usecases/get_notifications_use_case.dart';
// import '../../domain/usecases/register_device_use_case.dart';
// import 'notifications_event.dart';
// import 'notifications_state.dart';

// class NotificationsBloc
//     extends Bloc<NotificationsEvent, NotificationsState> {
//   final RegisterDeviceUseCase registerDeviceUseCase;
//   final GetNotificationsUseCase getNotificationsUseCase;
//   final FirebaseMessagingService firebaseMessagingService;

//   NotificationsBloc({
//     required this.registerDeviceUseCase,
//     required this.getNotificationsUseCase,
//     required this.firebaseMessagingService,
//   }) : super(NotificationsInitial()) {
//     on<RegisterCurrentDeviceEvent>(
//       _registerCurrentDevice,
//     );

//     on<GetNotificationsEvent>(
//       _getNotifications,
//     );
//   }

//   Future<void> _getNotifications(
//     GetNotificationsEvent event,
//     Emitter<NotificationsState> emit,
//   ) async {
//     emit(NotificationsLoading());

//     try {
//       final notifications =
//           await getNotificationsUseCase.call();

//       emit(
//         NotificationsLoaded(notifications),
//       );
//     } catch (e) {
//       emit(
//         NotificationsError(
//           e.toString(),
//         ),
//       );
//     }
//   }
//   // تسجيل الجهاز بالـ Backend
//   Future<void> _registerCurrentDevice(
//     RegisterCurrentDeviceEvent event,
//     Emitter<NotificationsState> emit,
//   ) async {
//     emit(NotificationsLoading());

//     try {
//       final fcmToken =
//           await firebaseMessagingService.getToken();

//       print('==============================');
//       print('🔥 FCM TOKEN: $fcmToken');
//       print('==============================');

//       if (fcmToken == null || fcmToken.isEmpty) {
//         emit(
//           NotificationsError(
//             'FCM Token not found',
//           ),
//         );
//         return;
//       }

//       final deviceType = Platform.isAndroid
//           ? 'android'
//           : 'ios';

//       print('📱 DEVICE TYPE: $deviceType');

//       final result =
//           await registerDeviceUseCase.call(
//         fcmToken: fcmToken,
//         deviceType: deviceType,
//       );

//       print('==============================');
//       print('✅ DEVICE REGISTERED SUCCESSFULLY');
//       print('📥 RESPONSE: $result');
//       print('==============================');

//       emit(
//         DeviceRegisteredSuccess(result),
//       );
//     } catch (e, stackTrace) {
//       print('==============================');
//       print('❌ REGISTER DEVICE ERROR');
//       print('ERROR: $e');
//       print('STACK TRACE: $stackTrace');
//       print('==============================');

//       emit(
//         NotificationsError(
//           e.toString(),
//         ),
//       );
//     }
//   }
// }

import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/firebase_messaging_service.dart';

import '../../domain/entities/notification_entity.dart';
import '../../domain/usecases/get_notifications_use_case.dart';
import '../../domain/usecases/register_device_use_case.dart';

import 'notifications_event.dart';
import 'notifications_state.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  final RegisterDeviceUseCase registerDeviceUseCase;

  final GetNotificationsUseCase getNotificationsUseCase;

  final FirebaseMessagingService firebaseMessagingService;
  
  List<NotificationEntity> _notifications = [];

  NotificationsBloc({
    required this.registerDeviceUseCase,
    required this.getNotificationsUseCase,
    required this.firebaseMessagingService,
  }) : super(NotificationsInitial()) {
    on<RegisterCurrentDeviceEvent>(_registerCurrentDevice);

    on<GetNotificationsEvent>(_getNotifications);

    on<NotificationReceivedEvent>(_onNotificationReceived);
  }

  // =====================================================
  // GET NOTIFICATIONS
  // =====================================================

  Future<void> _getNotifications(
  GetNotificationsEvent event,
  Emitter<NotificationsState> emit,
) async {
  print('🟡 GET NOTIFICATIONS EVENT RECEIVED');

  emit(NotificationsLoading());

  try {
    print('🟡 CALLING GET NOTIFICATIONS USE CASE');

   final notifications =
    await getNotificationsUseCase();
    
    print(
      '🟢 NOTIFICATIONS RECEIVED: ${notifications.length}',
    );

_notifications = notifications;

emit(
  NotificationsLoaded(
    List.unmodifiable(_notifications),
  ),
);


  
  } catch (e, stackTrace) {
    print('🔴 GET NOTIFICATIONS ERROR: $e');
    print(stackTrace);

    emit(
      NotificationsError(
        e.toString().replaceAll(
          'Exception: ',
          '',
        ),
      ),
    );
  }
}

  // =====================================================
  // REGISTER DEVICE
  // =====================================================

  Future<void> _registerCurrentDevice(
    RegisterCurrentDeviceEvent event,
    Emitter<NotificationsState> emit,
  ) async {
    try {
      final fcmToken = await firebaseMessagingService.getToken();

      if (fcmToken == null || fcmToken.isEmpty) {
        emit(NotificationsError('FCM Token not found'));

        return;
      }

      final deviceType = Platform.isAndroid ? 'android' : 'ios';

      final result = await registerDeviceUseCase.call(
        fcmToken: fcmToken,
        deviceType: deviceType,
      );

      emit(DeviceRegisteredSuccess(result));
    } catch (e) {
      emit(NotificationsError(e.toString().replaceAll('Exception: ', '')));
    }
  }

  // =====================================================
  // REAL TIME NOTIFICATION
  // =====================================================

  Future<void> _onNotificationReceived(
  NotificationReceivedEvent event,
  Emitter<NotificationsState> emit,
) async {
  final message = event.message;

  print('==============================');
  print('🔔 NOTIFICATION RECEIVED');
  print(
    'TITLE: ${message.notification?.title}',
  );
  print(
    'BODY: ${message.notification?.body}',
  );
  print(
    'DATA: ${message.data}',
  );
  print('==============================');

  final notification =
      NotificationEntity(
    id: DateTime.now()
        .millisecondsSinceEpoch,

    userId: null,

    title:
        message.notification?.title ?? '',

    body:
        message.notification?.body ?? '',

    type:
        message.data['type'] ?? 'general',

    data:
        Map<String, dynamic>.from(
      message.data,
    ),

    isRead: false,

    createdAt: DateTime.now(),

    updatedAt: DateTime.now(),
  );

  _notifications = [
    notification,
    ..._notifications,
  ];

  emit(
    NotificationsLoaded(
      List.unmodifiable(_notifications),
    ),
  );
}
}
