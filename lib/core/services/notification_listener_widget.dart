import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/notifications/presentation/bloc/notifications_bloc.dart';
import '../../features/notifications/presentation/bloc/notifications_event.dart';

class NotificationListenerWidget
    extends StatefulWidget {
  final Widget child;

  const NotificationListenerWidget({
    super.key,
    required this.child,
  });

  @override
  State<NotificationListenerWidget> createState() =>
      _NotificationListenerWidgetState();
}

class _NotificationListenerWidgetState
    extends State<NotificationListenerWidget> {
  StreamSubscription<RemoteMessage>?
      _messageSubscription;

  @override
  void initState() {
    super.initState();

    print(
      '🔥 NotificationListenerWidget started',
    );

    _messageSubscription =
        FirebaseMessaging.onMessage.listen(
      (message) {
        print(
          '📩 FCM MESSAGE RECEIVED IN APP',
        );

        print(
          'TITLE: ${message.notification?.title}',
        );

        print(
          'BODY: ${message.notification?.body}',
        );

        print(
          'DATA: ${message.data}',
        );

        context
            .read<NotificationsBloc>()
            .add(
              NotificationReceivedEvent(
                message,
              ),
            );
      },
    );
  }

  @override
  void dispose() {
    _messageSubscription?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}