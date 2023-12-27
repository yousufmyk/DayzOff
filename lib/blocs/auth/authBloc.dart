 

import 'package:dayzoff/repo/authRepo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'authEvents.dart';
part 'authState.dart';

class AuthBloc extends Bloc<AuthEvent, AuthSate> {
  final AuthRepo authRepo;
  AuthBloc({required this.authRepo}) : super(UnAuthenticated()){
    on<SignUpRequested>((event, emit) async{
      emit(Loading());
      try {
        await authRepo.signup(email: event.email, password: event.password);
      } catch (e) {
        emit(UnAuthenticated());
      }
    },);
  }
  
}