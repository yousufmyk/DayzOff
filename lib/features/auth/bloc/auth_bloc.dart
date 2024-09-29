import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dayzoff/features/dataModels/employeeModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
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
  
firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  
  Future<FutureOr<void>> signUpEvent(
      SignUpEvent event, Emitter<AuthState> emit) async {
        emit(LoadingState());
        firebase_storage.Reference ref =
                      firebase_storage.FirebaseStorage.instance.ref("/${event.fullName!}/" +
                          event.email.toString());
                  firebase_storage.UploadTask uploadTask =
                      ref.putFile(event.imageFile!.absolute);
                      Future.value(uploadTask).then((value) async {
                    var newUrl = await ref.getDownloadURL();
                    try {
      
      
      await auth
          .createUserWithEmailAndPassword(
              email: event.email.toString(),
              password: event.password.toString())
          .then(
            (value) => {
              
              fireStore.collection("users").doc(event.email).set(
                {
                  'id': value.user!.uid.toString(),
                  'fullName': event.fullName,
                  'preferredName': event.preferredName,
                  'employee': event.employeID,
                  'department': event.department,
                  'phoneNumber': event.phoneNum,
                  'email': event.email,
                  'image': newUrl,
                },
              ),
              emit(SignUpSucessState()),
              // .then((value) => {
              //   emit(SignUpSucessState()),
              //       // print(
              //       //     'DocumentSnapshot added with ID: ${event.email}')
              //     })
              // .onError((error, stackTrace) =>
              //     {print("this is the error ${error.toString()}")})
            },
          );
          
          // .then((value) => {
          //   firebase_storage.Reference ,ref =
          //             firebase_storage.FirebaseStorage.instance.ref(event.fullName! +
          //                 event.email.toString()),
          //   firebase_storage.UploadTask ,uploadTask =
          //             ref.putFile(event.imageFile!.absolute),
          //   Future.value(uploadTask).then((value) async {
          //           var newUrl = await ref.getDownloadURL();

          //           String id = event.email.toString();

          //           fireStore.collection("users").doc(event.email).set(
          //               {
          //                 'image': newUrl.toString()
          //               }
          //           );
          //         })
          // });
    } on FirebaseAuthException catch (e) {
      final message = e.code;

      emit(
        AuthErrorState(errorMessage: message),
      );
    }
                    });
    

    //  catch (e) {
    //   print("${e.toString()} this is the error fromt try catch");
    // }
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
      } on FirebaseException catch (e) {
        emit(AuthErrorState(errorMessage: e.toString()));
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
    } on FirebaseAuthException catch (e) {
      final message = e.code;

      emit(
        AuthErrorState(errorMessage: message),
      );
    }
  }
}
