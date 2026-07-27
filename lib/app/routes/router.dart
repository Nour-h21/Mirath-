import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mirath/features/ai_chat/presentation/pages/ai_chat_page.dart';
import 'package:mirath/features/change_password/presentation/pages/forgot_password.dart';
import 'package:mirath/features/educational_profile/presentation/pages/all_exams.dart';

import '../../features/awards/presentation/bloc/awards_bloc.dart';
import '../../features/awards/presentation/bloc/awards_event.dart';
import '../../features/awards/presentation/pages/awards.dart';
import '../../features/cart/presentation/bloc/cart/cart_bloc.dart';
import '../../features/cart/presentation/bloc/cart/cart_event.dart';
import '../../features/cart/presentation/pages/shopping_cart.dart';
import '../../features/educational_profile/presentation/bloc/bloc/educational_profile_bloc.dart';
import '../../features/educational_profile/presentation/bloc/bloc/educational_profile_event.dart';
import '../../features/educational_profile/presentation/pages/educational_profile.dart';
import '../../features/login/presentation/pages/login.dart';
import '../../features/notifications/presentation/pages/notifications_page.dart';
import '../../features/revision_section/presentation/bloc/revision_section_bloc.dart';
import '../../features/revision_section/presentation/bloc/revision_section_event.dart';
import '../../features/revision_section/presentation/pages/revision_section.dart';
import '../../features/signup/presentation/bloc/Nationality/nationality_bloc.dart';
import '../../features/signup/presentation/bloc/Nationality/nationality_event.dart';
import '../../features/signup/presentation/bloc/signup/signup_bloc.dart';
import '../../features/signup/presentation/pages/signup.dart';
import '../../features/change_password/presentation/bloc/change_password_bloc.dart';
import '../../features/change_password/presentation/pages/check_code.dart';
import '../../features/change_password/presentation/pages/reset_password.dart';
import '../../features/user_points/presentation/bloc/user_points_bloc.dart';
import '../../features/user_points/presentation/bloc/user_points_event.dart';
import '../di/injection_container.dart';

final GoRouter router = GoRouter(
  initialLocation:  "/educational-profile",
  routes: [
    GoRoute(
      path: "/LoginPage",
      builder: (context, state) {
        return LoginPage();
      },
    ),

    GoRoute(
      path: "/SignupPage",
      builder: (context, state) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => getIt<SignupBloc>()),

            BlocProvider(
              create: (_) =>
                  getIt<NationalityBloc>()..add(GetNationalitiesEvent()),
            ),
          ],
          child: const SignupPage(),
        );
      },
    ),

    GoRoute(
      path: "/NotificationsPage",
      builder: (context, state) => NotificationsPage(),
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
          path: "/forgotPassword",
          builder: (context, state) => ForgotPassword(),
        ),
        GoRoute(
          path: "/checkCode",
          builder: (context, state) {
            final email = state.extra as String;

            return CheckCode(email: email);
          },
        ),
        GoRoute(
          path: "/resetPassword",
          builder: (context, state) => ResetPassword(),
        ),
      ],
    ),

    GoRoute(
      path: "/revision-section",
      builder: (context, state) => BlocProvider(
        create: (_) => getIt<ReviewListBloc>()..add(GetReviewListEvent()),
        child: ReviewListPage(),
      ),
    ),

    ShellRoute(
      builder: (context, state, child) {
        return BlocProvider(
          create: (_) => getIt<UserPointsBloc>()..add(GetUserPointsEvent()),
          child: child,
        );
      },
      routes: [
        ShellRoute(
          builder: (context, state, child) {
            return BlocProvider(
              create: (_) =>
                  getIt<EducationalProfileBloc>()
                    ..add(GetEducationalProfileEvent()),
              child: child,
            );
          },
          routes: [
            GoRoute(
              path: "/educational-profile",
              builder: (context, state) => EducationalProfile(),
            ),
            GoRoute(path: "/allExams", builder: (context, state) => AllExams()),
          ],
        ),

        ShellRoute(
          builder: (context, state, child) {
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (_) => getIt<CartBloc>()..add(GetCartEvent()),
                ),
              ],
              child: child,
            );
          },
          routes: [
            GoRoute(
              path: "/awards",
              builder: (context, state) {
                return BlocProvider(
                  create: (_) =>
                      getIt<AwardsBloc>()..add(GetLibraryBooksEvent()),
                  child: Awards(),
                );
              },
            ),

            GoRoute(
              path: "/shoppingCart",
              builder: (context, state) {
                return ShoppingCart();
              },
            ),
          ],
        ),
      ],
    ),

    GoRoute(
      path: "/aiChatPage",
      builder: (context, state) {
        return AiChatPage();
      },
    ),
  ],
);
