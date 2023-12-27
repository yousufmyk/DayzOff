import 'package:firebase_auth/firebase_auth.dart';

class AuthRepo{
  final _firebaseAurh = FirebaseAuth.instance;
  //This is for registration
  Future<void> signup({required String email,required String password}) async {
    try {
      _firebaseAurh.createUserWithEmailAndPassword(email: email, password: password).then((value) => {
        print('User created')
      });
    } on FirebaseAuthException catch (e){
      if (e.code == 'weak-password') {
        throw Exception('This password is too weak');
      }
    }
    
    catch (e) {
      throw Exception(e.toString());
    }
  }
}