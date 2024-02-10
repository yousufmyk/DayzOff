part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}
final class AuthActionState extends AuthState{}

final class AuthInitial extends AuthState {}


// final class LoginLoadingState extends AuthActionState{}
// final class SingUpLoadingState extends AuthActionState{}
final class NavigateToHomeScreen extends AuthActionState{
  final EmployeeData? employeeData;

  NavigateToHomeScreen({required this.employeeData});
}
final class AuthErrorState extends AuthActionState{
  final String? errorMessage;

  AuthErrorState({required this.errorMessage});
}
final class LoadingState extends AuthState{}
final class SucessState extends AuthState{}
// final class LoginSucessState extends AuthActionState{}
// final class SignUpSucessState extends AuthActionState{}
final class AuthLoadingState extends AuthState{}

