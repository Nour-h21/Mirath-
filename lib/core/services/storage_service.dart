import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static const String tokenKey = "user_token";
  static const String userIdKey = "userId";
  static const String firstLaunchKey = "is_first_launch";

  final SharedPreferences prefs;

  StorageService(this.prefs);

  /// Save token
  Future<void> saveToken(String token) async {
    await prefs.setString(tokenKey, token);
  }

  /// Get token
  String? getToken() {
    return prefs.getString(tokenKey);
  }

  /// Remove token (logout)
  Future<void> clearToken() async {
    await prefs.remove(tokenKey);
  }

   Future<void> clearUserId() async {
    await prefs.remove(userIdKey);
  }

  Future<void> saveUserId(String userId) async {
    await prefs.setString(userIdKey, userId);
  }

  String? getUserId() {
    return prefs.getString(userIdKey);
  }
  

  // bool get isLoggedIn => getToken() != null;
  bool get isLoggedIn => getToken() != null && getToken()!.isNotEmpty;

   // First Launch
  Future<void> setFirstLaunchDone() async => prefs.setBool(firstLaunchKey, false);
  bool get isFirstLaunch => prefs.getBool(firstLaunchKey) ?? true;

  
  // ⭐️ إضافة هذه الوظيفة لإعادة Onboarding
  Future<void> setFirstLaunchToTrue() async {
    await prefs.setBool(firstLaunchKey, true);
  }
}