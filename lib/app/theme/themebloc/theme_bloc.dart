import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/design/theme/app_theme.dart';
import '../../di/injection_container.dart';
import 'theme_event.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeData> {
  ThemeBloc() : super(AppTheme.light) {
    on<InitThemeEvent>((event, emit) async {
      bool isDarkTheme = await isDark();
      emit(isDarkTheme ? AppTheme.dark : AppTheme.light);
    });
    on<ChangeThemeEvent>((event, emit) {
      bool isDarkTheme = state == AppTheme.dark;
      emit(isDarkTheme ? AppTheme.light : AppTheme.dark);
      setTheme(!isDarkTheme);
    });
  }
  Future<bool> isDark() async {
    return getIt.get<SharedPreferences>().getBool('is_dark') ?? false;
  }

  Future<void> setTheme(bool isDark) async {
    getIt.get<SharedPreferences>().setBool('is_dark', isDark);
  }
}
