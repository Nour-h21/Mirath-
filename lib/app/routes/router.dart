import 'package:go_router/go_router.dart';

import '../../features/signup/presentation/pages/signup.dart';

final GoRouter router = GoRouter(
  initialLocation: '/ResponsiveTestPage',
  routes: [
  GoRoute(
      path: '/ResponsiveTestPage',
      builder: (context, state) {
        return ResponsiveTestPage();
      },
    ),
  ],
);
