abstract class SignupEvent {}

class SubmitSignupEvent extends SignupEvent {
  final String name;
  final String nickName;
  final String email;
  final String password;
  final String confirmPassword;
  final int age;
  final int nationalityId;

  SubmitSignupEvent({
    required this.name,
    required this.nickName,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.age,
    required this.nationalityId,
  });
}