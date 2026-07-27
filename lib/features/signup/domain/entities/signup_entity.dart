class SignupEntity {
  final int id;
  final int roleId;
  final String googleId;
  final String name;
  final String nickName;
  final String email;
  final String emailVerifiedAt;
  final int age;
  final int nationalityId;
  final String photo;
  final String token;

  SignupEntity({
    required this.id,
    required this.roleId,
    required this.googleId,
    required this.name,
    required this.nickName,
    required this.email,
    required this.emailVerifiedAt,
    required this.age,
    required this.nationalityId,
    required this.photo,
    required this.token,
  });
}
