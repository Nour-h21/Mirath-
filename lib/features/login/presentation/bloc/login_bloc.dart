import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecase/google_login_usecase.dart';
import '../../domain/usecase/login_usecase.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;
  final GoogleLoginUseCase googleLoginUseCase;

  LoginBloc(this.loginUseCase, this.googleLoginUseCase)
    : super(LoginInitial()) {
    on<LoginSubmitted>(_onLoginSubmitted);

    on<GoogleLoginPressed>(_onGoogleLoginPressed);
  }

  Future<void> _onLoginSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    try {
      emit(LoginLoading());

      final user = await loginUseCase(
        email: event.email,
        password: event.password,
      );

      emit(LoginSuccess(user));

     
    }on DioException catch (e) {
      final message = e.response?.data['message'];
       if (message.toString().contains('User email & password does not with our record.')) {
        emit(LoginError("كلمة المرور غير صحيحة "));
      } else if (message.toString().contains('you have sent invalid data')) {
        emit(LoginError("البريد الإلكتروني غير صحيح"));
      }
     else{emit(LoginError("pppppppppppplll:${e.toString()}"));} 
    }
  }

  Future<void> _onGoogleLoginPressed(
    GoogleLoginPressed event,
    Emitter<LoginState> emit,
  ) async {
    try {
      emit(LoginLoading());

      final user = await googleLoginUseCase();

      emit(LoginSuccess(user));
    } on DioException catch (e) {
      final message = e.response?.data['message'];
       if (message.toString().contains('Failed to verify Google JWT token: Syntax error, malformed JSON')) {
        emit(LoginError("كلمة المرور غير صحيحة "));
      } else if (message.toString().contains('No account found with this email. Please register first.')) {
        emit(LoginError("هذا البريد الإلكتروني غير موجود,قم بإنشاء حساب أولاً"));
      }
     else{emit(LoginError("pppppppppppplll:${e.toString()}"));} 
    }
  }
}
