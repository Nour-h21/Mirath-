import 'package:dio/dio.dart';

import '../../core/constants/urls.dart';
import '../../core/services/storage_service.dart';
import 'injection_container.dart';

Future<void> initCoreModule() async {

// getIt.registerSingleton(await SharedPreferences.getInstance());

 getIt.registerLazySingleton<Dio>((){
  final dio = Dio(
    BaseOptions(
      baseUrl: AppUrls.baseUrl,
      // connectTimeout: AppApi.connectTimeout,
      // receiveTimeout: AppApi.receiveTimeout,
    ),
  );

dio.interceptors.add(
  InterceptorsWrapper(
    onRequest: (options, handler) async {
      // Endpoints لا تحتاج توكن
      const authFreeEndpoints = [
        "register",
        "signin",
        "userForgotPassword",
        "userResetPassword",
        "userCheckCode",
      ];

      // إذا الـ endpoint موجود ضمن القائمة → ما نضيف توكن
      if (authFreeEndpoints.any((e) => options.path.contains(e))) {
        return handler.next(options);
      }
final storage = getIt<StorageService>();
      // غير هيك → نضيف التوكن
      final token = await storage.getToken();
      print("ppppppppppppppppppppppppppppppppppppppppppppp${token}");
      if (token != null && token.isNotEmpty) {
        
       options.headers['Authorization'] = 'Bearer $token';
        // options.headers['Authorization'] = 'Bearer 1|MnRE2dCMFGRQWPXh4BfUWYDJKK1ez1dva4LDneN07463b92e';
      }

      return handler.next(options);
    },
  ),


);
  return dio;
});

}