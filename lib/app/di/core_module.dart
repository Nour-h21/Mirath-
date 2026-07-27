import 'package:dio/dio.dart';

import '../../core/constants/urls.dart';
import '../../core/services/storage_service.dart';
import 'injection_container.dart';

Future<void> initCoreModule() async {
  // getIt.registerSingleton(await SharedPreferences.getInstance());

  getIt.registerLazySingleton<Dio>(() {
    final dio = Dio(
      BaseOptions(
        baseUrl: AppUrls.baseUrl,
        connectTimeout: Duration(seconds: 20),
        receiveTimeout: Duration(seconds: 20),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // Endpoints لا تحتاج توكن
          const authFreeEndpoints = [
            "register",
            "signin",
            "authGoogle",
            "userForgotPassword",
            "userResetPassword",
            "userCheckCode",
          ];

          // إذا الـ endpoint موجود ضمن القائمة → ما نضيف توكن
          if (authFreeEndpoints.any((e) => options.path.contains(e))) {
            return handler.next(options);
          }
          final storage = getIt<StorageService>();
            // storage.clearToken();
          // غير هيك → نضيف التوكن
          final token = storage.getToken();
          print("ppppppppppppppppppppppppppppppppppppppppppppp $token");
          if (token != null && token.isNotEmpty) {
           options.headers['Authorization'] = 'Bearer $token';
            //  options.headers['Authorization'] = 'Bearer 1|Y2yRp1gqP2Hlvns2HMbnkl2y0mptzSEBvDvEufOt8cfaf0b2';
          }

          return handler.next(options);
        },
      ),
    );
    return dio;
  });
}
