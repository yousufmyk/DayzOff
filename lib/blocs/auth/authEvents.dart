
part of 'authBloc.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}
class SignUpRequested extends AuthEvent{
  final String email;
  final String password;

  SignUpRequested({required this.email, required this.password});
}