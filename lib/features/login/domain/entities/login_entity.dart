class LoginEntity {

  final int id;
  final int roleId;
  final String name;
  final String nickName;
  final String email;
  final String age;
  final int nationalityId;
  final String photo;
  final String token;
  final String? message;
  final Map<String,dynamic>? errors;

  const LoginEntity({
   required this.errors,
   required this.message,
    required this.id,
    required this.roleId,
    required this.name,
    required this.nickName,
    required this.email,
    required this.age,
    required this.nationalityId,
    required this.photo,
    required this.token,
  });
}
