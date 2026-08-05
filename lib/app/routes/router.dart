import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mirath/features/ai_chat/presentation/pages/ai_chat_page.dart';
import 'package:mirath/features/change_password/presentation/pages/forgot_password.dart';
import 'package:mirath/features/chapter_details_page/presentation/bloc/chapter_details_bloc.dart';
import 'package:mirath/features/create_summary_page/presentation/bloc/create_summary_page_bloc.dart';
import 'package:mirath/features/login/presentation/bloc/login_bloc.dart';
import 'package:mirath/features/upload_summary_page/presentation/bloc/upload_summary_page_bloc.dart';

import '../../features/analytical_study_page/presentation/bloc/analytical_study_page_bloc.dart';
import '../../features/analytical_study_page/presentation/bloc/analytical_study_page_event.dart';
import '../../features/analytical_study_page/presentation/page/analytical_study_page.dart';
import '../../features/automated_quiz_page/domain/entities/quiz_result_entity.dart';
import '../../features/automated_quiz_page/presentation/bloc/automated_quiz_page_bloc.dart';
import '../../features/automated_quiz_page/presentation/bloc/automated_quiz_page_event.dart';
import '../../features/automated_quiz_page/presentation/page/automated_quiz_page.dart';
import '../../features/automated_quiz_page/presentation/page/quiz_result.dart';
import '../../features/books_page/presentation/bloc/books_page_bloc.dart';
import '../../features/books_page/presentation/page/books_page.dart';
import '../../features/chapter_details_page/presentation/page/choose_study_way.dart';
import '../../features/chapter_details_page/presentation/page/split_pdfAndAudio&summary/pdf_with_audio_page.dart';
import '../../features/chapter_details_page/presentation/page/split_pdfAndAudio&summary/split_pdf&summary_page.dart';
import '../../features/chapter_details_page/presentation/page/split_video&summary/split_video&summary_page.dart';
import '../../features/home/presentation/bloc/home_bloc.dart';
import '../../features/home/presentation/page/home_page.dart';
import '../../features/home/presentation/widgets/navigation_bar.dart';
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
import '../../features/my_summary_page/presentation/bloc/my_summary_page_bloc.dart';
import '../../features/my_summary_page/presentation/page/my_summary_page.dart';
import '../../features/on_boarding/on_boarding.dart';
import '../../features/one_book/presentation/bloc/one_book_bloc.dart';
import '../../features/one_book/presentation/page/one_book_page.dart';
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
import '../../features/summary_details_page/presentation/bloc/summary_details_bloc.dart';
import '../../features/summary_details_page/presentation/bloc/summary_details_event.dart';
import '../../features/summary_details_page/presentation/pages/details_ext_summary_page.dart';
import '../../features/summary_details_page/presentation/pages/details_int_summary_page.dart';
import '../../features/upload_summary_page/presentation/bloc/upload_summary_page_event.dart';
import '../../features/upload_summary_page/presentation/page/upload_summary_page.dart';
import '../../features/user_points/presentation/bloc/user_points_bloc.dart';
import '../../features/user_points/presentation/bloc/user_points_event.dart';
import '../di/injection_container.dart';

final GoRouter router = GoRouter(
  
  initialLocation:  "/SignupPage",
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
    GoRoute(
      path: '/Onboarding',
      builder: (context, state) {
        return Onboarding();
      },
    ),
    GoRoute(
      path: '/SecondPage',
      builder: (context, state) {
        return SecondPage();
      },
    ),
    GoRoute(
      path: '/ThirdPage',
      builder: (context, state) {
        return ThirdPage();
      },
    ),
    ShellRoute(
      builder: (context, state, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => getIt<ChangePasswordBloc>()),
            BlocProvider(create: (_) => getIt<LoginBloc>()),
            BlocProvider(create: (_) => getIt<HomeBloc>()),
            BlocProvider(create: (_) => getIt<BooksBloc>()),
            BlocProvider(create: (_) => getIt<BookDetailsBloc>()),
            BlocProvider(create: (_) => getIt<ChapterDetailsBloc>()),
            BlocProvider(create: (_) => getIt<CreateSummaryBloc>()),
            BlocProvider(create: (_) => getIt<MySummaryBloc>()),
            BlocProvider(create: (_) => getIt<SummaryDetailsBloc>()),
            BlocProvider(create: (_) => getIt<UploadSummaryBloc>()),
            BlocProvider(create: (_) => getIt<QuizBloc>()),
            BlocProvider(create: (_) => getIt<AnalyticalBloc>()),
          ],
          child: child,
        );
      },
      routes: [
        GoRoute(
          path: '/LoginPage',
          builder: (context, state) {
            return LoginPage();
          },
        ),
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
        GoRoute(
          path: '/NavicationBar',
          builder: (context, state) {
            return NavicationBar();
          },
        ),
        GoRoute(
          path: '/HomePage',
          builder: (context, state) {
            return HomePage();
          },
        ),

        GoRoute(
          path: '/BooksPage',
          builder: (context, state) {
            final classificationId = state.extra as int;
            return BooksPage(classificationId: classificationId);
          },
        ),
        GoRoute(
          path: '/OneBookPage',
          builder: (context, state) {
            final bookId = state.extra as int;
            return OneBookPage(bookId: bookId);
          },
        ),
        GoRoute(
          path: '/SplitPdfAndSummaryPage',
          builder: (context, state) {
            // final chapterId = state.extra as int;
            final args = state.extra as PdfPageArgs;
            return BlocProvider(
              create: (_) => getIt<ChapterDetailsBloc>(),
              child: SplitPdfAndSummaryPage(
                chapterId: args.chapterId,
                autherName: args.authorName,
              ),
            );
          },
        ),
        GoRoute(
          path: '/SplitVideoAndSummaryPage',
          builder: (context, state) {
            final args = state.extra as VideoPageArgs;

            return SplitVideoAndSummaryPage(args: args);
          },
        ),
        GoRoute(
          path: '/ChooseStudyWay',
          builder: (context, state) {
            final args = state.extra as ChooseStudyWayArgs;

            return ChooseStudyWay(
              chapterId: args.chapterId,
              authorName: args.authorName,
            );
          },
        ),
        GoRoute(
          path: '/MySummaryPage',
          builder: (context, state) {
            return MySummaryPage();
          },
        ),
        GoRoute(
          path: '/ExternalSummaryPage',
          builder: (context, state) {
            return MySummaryPage();
          },
        ),
        GoRoute(
          path: '/SummaryIntDetailsPage',
          builder: (context, state) {
            final id = state.extra as int;

            return BlocProvider(
              create: (_) =>
                  getIt<SummaryDetailsBloc>()..add(GetSummaryDetailsEvent(id)),
              child: SummaryIntDetailsPage(summaryId: id),
            );
          },
        ),
        GoRoute(
          path: '/SummaryExtDetailsPage',
          builder: (context, state) {
            final id = state.extra as int;

            return BlocProvider(
              create: (_) =>
                  getIt<SummaryDetailsBloc>()..add(GetSummaryDetailsEvent(id)),
              child: SummaryExtDetailsPage(summaryId: id),
            );
          },
        ),
        GoRoute(
          path: '/UploadSummaryPage',
          builder: (context, state) {
            return BlocProvider(
              create: (context) =>
                  getIt<UploadSummaryBloc>()
                    ..add(GetClassificationsDropDownEvent()),

              child: const UploadSummaryPage(),
            );
          },
        ),
        GoRoute(
          path: '/AutomatedQuizPage',
          builder: (context, state) {
            final chapterId = state.extra as int;

            return BlocProvider(
              create: (context) =>
                  getIt<QuizBloc>()..add(StartQuizEvent(chapterId)),

              child: AutomatedQuizPage(chapterId: chapterId),
            );
          },
        ),
        GoRoute(
          path: '/HightQuizResultWithPoint',

          builder: (context, state) {
            final result = state.extra as QuizResultEntity;

            return HightQuizResultWithPoint(result: result);
          },
        ),

        GoRoute(
          path: '/HightQuizResult',

          builder: (context, state) {
            final result = state.extra as QuizResultEntity;

            return HightQuizResult(result: result);
          },
        ),

        GoRoute(
          path: '/FailingQuizResult',

          builder: (context, state) {
            final result = state.extra as QuizResultEntity;

            return FailingQuizResult(result: result);
          },
        ),

        GoRoute(
          path: '/MiddelQuizResult',

          builder: (context, state) {
            final result = state.extra as QuizResultEntity;

            return MiddelQuizResult(result: result);
          },
        ),

        GoRoute(
          path: '/AnalyticalStudyPage',
          builder: (context, state) {
            final chapterId = state.extra as int;

            return BlocProvider(
              create: (_) =>
                  getIt<AnalyticalBloc>()
                    ..add(LoadAnalyticalQuestionsEvent(chapterId)),
              child: const AnalyticalStudyPage(),
            );
          },
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
