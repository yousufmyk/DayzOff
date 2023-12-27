import 'package:dayzoff/blocs/auth/authBloc.dart';
import 'package:dayzoff/repo/authRepo.dart';
import 'package:dayzoff/screens/auth/loginScreen.dart';
import 'package:dayzoff/screens/test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(

      create: (context) => AuthRepo(),
      child: BlocProvider(
        create: (context) => AuthBloc(
          authRepo: RepositoryProvider.of<AuthRepo>(context)
        ),
        child: MaterialApp(
          
          theme: ThemeData(
            
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: LoginScreen(),
          //home: TestScreen(),
        ),
      ),
    );
  }
}
