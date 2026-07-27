import 'package:mirath/features/login/domain/entities/login_entity.dart';


abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {

  final LoginEntity user;

  LoginSuccess(this.user);
}

class LoginError extends LoginState {

  final String message;

  LoginError(this.message);
}