import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dayzoff/features/dataModels/employeeModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<SignUpEvent>(signUpEvent);
    on<LoginEvent>(loginEvent);
  }

  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;

  Future<FutureOr<void>> signUpEvent(
      SignUpEvent event, Emitter<AuthState> emit) async {
    try {
      await auth
          .createUserWithEmailAndPassword(
              email: event.email.toString(),
              password: event.password.toString())
          .then((value) => {
                fireStore
                    .collection("users")
                    .doc(event.email)
                    .set({
                      'id': value.user!.uid.toString(),
                      'fullName': event.fullName,
                      'preferredName': event.preferredName,
                      'employee': event.employeID,
                      'department': event.department,
                      'phoneNumber': event.phoneNum,
                      'email': event.email,
                    })
                    .then((value) => {
                          print(
                              'DocumentSnapshot added with ID: ${event.email}')
                        })
                    .onError((error, stackTrace) =>
                        {print("this is the error ${error.toString()}")})
              });
    } catch (e) {
      print("${e.toString()} this is the error fromt try catch");
    }
  }

  FutureOr<void> loginEvent(LoginEvent event, Emitter<AuthState> emit) async {
    final docRef = fireStore.collection("users").doc(event.email);
    //late final String dep;
    //late EmployeeData empData;

    try {
      emit(LoadingState());
      await auth.signInWithEmailAndPassword(
          email: event.email.toString(), password: event.password.toString());

      try {
        await docRef.get().then((DocumentSnapshot doc) async {
          final data = doc.data() as Map<String, dynamic>;
          EmployeeData employeeData = EmployeeData.fromMap(data);
          emit(NavigateToHomeScreen(employeeData: employeeData));
        });
      } catch (e) {
        //print(event.email);
        print('there is some error on getData bloc${e.toString()}');
        //This is the error I was getting when there was internet problem "there is some error on getData bloctype 'Null' is not a subtype of type 'String'
        //" so need to fix this exception by doing this"e == theMsg" if true show there is some internet issue
      }
      // .then((value) => {
      //       print('user logged in'),

      //       emit(NavigateToHomeScreen()),

      //       // docRef.get().then(
      //       //   (DocumentSnapshot doc) async{
      //       //     final data =  doc.data() as Map<String, dynamic>;
      //       //      EmployeeData.fromMap(data);
      //       //     //empData = employeeData;
      //       //     // print(data['department']);
      //       //     // dep = data['department'].toString();

      //       //     // ...
      //       //   },
      //       //   onError: (e) => {
      //       //     emit(AuthErrorState(errorMessage: e.toString())),
      //       //     print("Error getting document: $e")
      //       //   },
      //       // ),

      //       // .whenComplete(
      //       //   () => emit(NavigateToHomeScreen()),
      //       // )
      //     }).onError((error, stackTrace) => {

      //     });
    } catch (e) {
      emit(AuthErrorState(errorMessage: e.toString()));
      print(e.toString());
    }
  }
}
