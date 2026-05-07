import 'package:go_router/go_router.dart';

import '../../features/login/presentation/pages/login.dart';
import '../../features/signup/presentation/pages/signup.dart';

final GoRouter router = GoRouter(
  initialLocation: '/SignupPage',
  routes: [GoRoute(
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
  ],
);
