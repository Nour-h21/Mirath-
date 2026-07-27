import '../../domain/entities/signup_entity.dart';

class SignupModel extends SignupEntity {
  SignupModel({
    required super.id,
    required super.roleId,
    required super.googleId,
    required super.name,
    required super.nickName,
    required super.email,
    required super.emailVerifiedAt,
    required super.age,
    required super.nationalityId,
    required super.photo,
    required super.token,
  });

  factory SignupModel.fromJson(Map<String, dynamic> json) {
    final data = json["data"] as Map<String, dynamic>;

    return SignupModel(
      id: data["id"] ?? 0,

      roleId: data["role_id"] ?? 0,

      googleId: data["google_id"]?.toString() ?? "",

      name: data["name"] ?? "",

      nickName: data["nick_name"] ?? "",

      email: data["email"] ?? "",

      emailVerifiedAt: data["email_verified_at"]?.toString() ?? "",

      age: int.tryParse(data["age"].toString()) ?? 0,
      
      nationalityId: int.tryParse(data["nationality_id"].toString()) ?? 0,

      photo: data["photo"] ?? "",

      token: data["token"] ?? "",
    );
  }
}
