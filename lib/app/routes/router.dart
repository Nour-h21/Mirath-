import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mirath/features/change_password/presentation/pages/forgot_password.dart';

import '../../features/login/presentation/pages/login.dart';
import '../../features/signup/presentation/pages/signup.dart';
import '../../features/change_password/presentation/bloc/change_password_bloc.dart';
import '../../features/change_password/presentation/pages/check_code.dart';
import '../../features/change_password/presentation/pages/reset_password.dart';
import '../di/injection_container.dart';

final GoRouter router = GoRouter(
  initialLocation: '/SignupPage',
  routes: [
    GoRoute(
      path: '/LoginPage',
      builder: (context, state) {
        return LoginPage();
      },
    ),

    GoRoute(
      path: '/SignupPage',
      builder: (context, state) {
        return SignupPage();
      },
    ),

    ShellRoute(
      builder: (context, state, child) {
        return BlocProvider(
          create: (_) => getIt<ChangePasswordBloc>(),
          child: child,
        );
      },
      routes: [
        GoRoute(
          path: '/forgotPassword',
          builder: (context, state) => ForgotPassword(),
        ),
        GoRoute(
          path: '/checkCode',
          builder: (context, state) {
            final email = state.extra as String;

            return CheckCode(email: email);
          },
        ),
        GoRoute(
          path: '/resetPassword',
          builder: (context, state) => ResetPassword(),
        ),
      ],
    ),
  ],
);
