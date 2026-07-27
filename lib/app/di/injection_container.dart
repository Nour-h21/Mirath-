import 'package:get_it/get_it.dart';
import 'package:mirath/app/di/signup_module.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/services/storage_service.dart';
import 'ai_chat_module.dart';
import 'awards_module.dart';
import 'cart_module.dart';
import 'change_password_module.dart';
import 'core_module.dart';
import 'educational_profile_module.dart';
import 'nationality_injection.dart';
import 'notifications_module.dart';
import 'review_list_module.dart';
import 'user_points_module.dart';


final getIt = GetIt.instance;

Future<void> init() async {
  await initCoreModule();
  await initChangePasswordModule();
  await initSignupModule();
  await initNationalityModule();
  await initEducationalProfileModule();
  await initReviewListModule();
  await initAwardsModule();
  await initCartModule();
  await initUserPointsModule();
  await initAiChatModule();
  await initNotificationsModule();
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