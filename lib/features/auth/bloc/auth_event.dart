part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

final class LoginEvent extends AuthEvent {
  final String? email;
  final String? password;

  LoginEvent({required this.email, required this.password});
}

final class SignUpEvent extends AuthEvent {
  final String? fullName;
  final String? preferredName;
  final String? employeID;
  final String? department;
  final String? phoneNum;
  final String? email;
  final String? password;
  final File? imageFile;

  SignUpEvent({
    required this.fullName,
    required this.preferredName,
    required this.employeID,
    required this.department,
    required this.phoneNum,
    required this.email,
    required this.password,
    required this.imageFile,
  });
}
