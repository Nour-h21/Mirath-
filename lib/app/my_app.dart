
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mirath/app/routes/router.dart';
import '../core/services/notification_listener_widget.dart';
import '../features/notifications/presentation/bloc/notifications_bloc.dart';
import '../features/notifications/presentation/bloc/notifications_event.dart';

import 'di/cart_module.dart';
import 'theme/themebloc/theme_bloc.dart';
import 'theme/themebloc/theme_event.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc()
        ..add(InitThemeEvent()),

      child: BlocBuilder<ThemeBloc, ThemeData>(
        builder: (context, state) {
          return BlocProvider<NotificationsBloc>(
            create: (_) => getIt<NotificationsBloc>()..add(GetNotificationsEvent()),

            child: NotificationListenerWidget(
              child: MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  textScaleFactor: 1.0,
                ),

                child: MaterialApp.router(
                  theme: state,
                  routerConfig: router,
                  debugShowCheckedModeBanner: false,
                ),
              ),
            ),
          );
        },
      ), 
    );
  }
}


