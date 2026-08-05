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
             "getNationalities",
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
      // // غير هيك → نضيف التوكن
      final token = await storage.getToken();
      print("ppppppppppppppppppppppppppppppppppppppppppppp${token}");
      if (token != null && token.isNotEmpty) {
        
       options.headers['Authorization'] = 'Bearer $token';
        // options.headers['Authorization'] = 'Bearer 2|AlbuRlyK02J6EoQMmiB4dTYWXUnlSCSq1i2VCAOS27c6b6b7';
      }

          return handler.next(options);
        },
      ),
    );
    return dio;
  });
}
