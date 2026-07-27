import 'package:mirath/features/login/domain/entities/login_entity.dart';

class LoginModel extends LoginEntity {
  const LoginModel({
    required super.id,
    required super.roleId,
    required super.name,
    required super.nickName,
    required super.email,
    required super.age,
    required super.nationalityId,
    required super.photo,
    required super.token,
    required super.errors,
    required super.message,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'];

    return LoginModel(
      id: data['id'],
      roleId: data['role_id'],
      name: data['name'],
      nickName: data['nick_name'],
      email: data['email'],
      age: data['age'],
      nationalityId: data['nationality_id'],
      photo: data['photo'],
      token: data['token'],
      message: data['message'],
      errors: data['errors'],
    );
  }
}
