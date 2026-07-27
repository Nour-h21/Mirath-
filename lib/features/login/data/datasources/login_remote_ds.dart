import 'package:dio/dio.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mirath/features/login/data/models/login_model.dart';

import '../../../../app/di/injection_container.dart';
import '../../../../core/services/storage_service.dart';

abstract class LoginRemoteDs {
  Future<LoginModel> login({required String email, required String password});

  Future<LoginModel> loginWithGoogle();
}

class LoginRemoteDsImpl implements LoginRemoteDs {
  final Dio dio;

  LoginRemoteDsImpl(this.dio);

  @override
  Future<LoginModel> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        "signin",

        data: {'email': email, 'password': password},
      );

      print(response.data);
      final loginModel = LoginModel.fromJson(response.data);
      print({"hiiiihhhmmmmmmmmmmmkkkkkk": loginModel.token});
      final storage = getIt<StorageService>();
      storage.saveToken(loginModel.token);
      return loginModel;
    } on DioException catch (e) {
      print("kkkkkkkkkk:${e.message}");

      rethrow;
    }
  }

  @override
  Future<LoginModel> loginWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn.instance;

    await googleSignIn.initialize(
      serverClientId:
          '921312382697-i8gsvtp6cvbcmqdgl379pau8g4lc9oo1.apps.googleusercontent.com',
    );

    final GoogleSignInAccount account = await googleSignIn.authenticate();

    final GoogleSignInAuthentication auth = account.authentication;

    try {
      final response = await dio.post(
        'authGoogle',

        data: {'id_token': auth.idToken},
      );

      // return LoginModel.fromJson(response.data);
      final loginModel = LoginModel.fromJson(response.data);
      print({"hiiiihhhmmmmmmmmmmmkkkkkk": loginModel.token});
      final token = loginModel.token;
      print({"TTTTTTTTTTTTTTTT": token});
      final storage = getIt<StorageService>();
      storage.saveToken(token);

      return loginModel;
    } on DioException catch (e) {
      print({"hiiiihhhhhhhhkkkkkkkkkkkkkkkkkkkkk": auth.idToken});
      print(e.message);

      rethrow;
    }
  }

  //   @override
  //   Future<LoginModel> loginWithGoogle() async {

  //     final GoogleSignIn googleSignIn = GoogleSignIn.instance;

  //     final GoogleSignInAccount? account = await googleSignIn.signIn();

  //     if (account == null) {
  //       throw Exception('Cancelled');
  //     }

  //     final auth = await account.authentication;

  //     print(auth.idToken);

  //     final response = await dio.post('authGoogle', data: {'id_token':auth.idToken });

  //     return LoginModel.fromJson(response.data);
  //   }

  //   final GoogleSignIn googleSignIn =
  //     GoogleSignIn.instance;
}
