import 'package:get_it/get_it.dart';
import 'package:mirath/app/di/automated_quiz_module.dart';
import 'package:mirath/app/di/feedback_module.dart';
import 'package:mirath/app/di/login_module.dart';
import 'package:mirath/app/di/my_summary_module.dart';
import 'package:mirath/app/di/summary_details_module.dart';
import 'package:mirath/app/di/signup_module.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/services/storage_service.dart';
import 'analytical_study_module.dart';
import 'books_module.dart';
import 'ai_chat_module.dart';
import 'awards_module.dart';
import 'cart_module.dart';
import 'change_password_module.dart';
import 'chapter_details_module.dart';
import 'core_module.dart';
import 'create_summary_module.dart';
import 'group_session_page_module.dart';
import 'home_module.dart';
import 'one_book_module.dart';
import 'upload_summary_module.dart';
import 'educational_profile_module.dart';
import 'nationality_injection.dart';
import 'notifications_module.dart';
import 'review_list_module.dart';
import 'user_points_module.dart';


final getIt = GetIt.instance;

Future<void> init() async {
  await initCoreModule();
  await initChangePasswordModule();
  await initLoginModule();
  await initBooksPageModule();
  await initOneBookPageModule();
  await initOneChapterDetailsModule();
  await initCreateSummaryModule();
  await initMySummaryModule();
  await initSummaryDetailsModule();
  await initAutomatedQuizModule();
  await initAnalyticalStudyModule();
  await initUploadSummaryModule();
  await initHomePageModule();
  await initSignupModule();
  await initNationalityModule();
  await initEducationalProfileModule();
  await initReviewListModule();
  await initAwardsModule();
  await initCartModule();
  await initUserPointsModule();
  await initAiChatModule();
  await initNotificationsModule();
  await initGroupSessionPageModule();
  await initFeedBackPageModule();
}

Future<void> setupDI() async {
  // 1️⃣ SharedPreferences
  final prefs = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(prefs);

  // 2️⃣ StorageService
  getIt.registerSingleton<StorageService>(
    StorageService(getIt<SharedPreferences>()),
  );
}