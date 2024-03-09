import 'package:dayzoff/features/auth/bloc/auth_bloc.dart';
import 'package:dayzoff/features/auth/ui/signUpScree.dart';
import 'package:dayzoff/features/constants/constants.dart';
import 'package:dayzoff/features/home/ui/homeScreen.dart';
import 'package:dayzoff/features/widgets/authButton.dart';
import 'package:dayzoff/features/widgets/authTextField.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthBloc authBloc = AuthBloc();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      bloc: authBloc,
      listenWhen: (previous, current) => current is AuthActionState,
      buildWhen: (previous, current) => current is! AuthActionState,
      listener: (context, state) {
        if (state is NavigateToHomeScreen) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HomeScreen(
                        employeeData: state.employeeData,
                      )));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case LoadingState:
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: orangeColor,
                ),
              ),
            );

          default:
            return Scaffold(
              resizeToAvoidBottomInset: false,
              body: Center(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        Image.network(
                          'https://firebasestorage.googleapis.com/v0/b/dayzoff-c2455.appspot.com/o/Screenshot_2024-01-16_at_3.24.23_PM-removebg-preview.png?alt=media&token=2119a33d-d133-4238-8495-135b4cccbe20',
                          height: 250,
                          width: 250,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Login',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        const Text(
                          'Please login to continue',
                          style: TextStyle(

                              //fontWeight: FontWeight.w200,
                              ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        AuthTextField(
                          controller: emailController,
                          icon: const Icon(Icons.email_outlined),
                          hintText: 'email',
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        AuthTextField(
                          controller: passwordController,
                          icon: const Icon(Icons.password_rounded),
                          hintText: 'password',
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        AuthButton(
                          onTap: () {
                            authBloc.add(LoginEvent(
                                email: emailController.text.toString(),
                                password: passwordController.text.toString()));
                          },
                          text: 'Login',
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Don't have an account? "),
                            InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => SignUpScreen()));
                                },
                                child: const Hero(
                                  tag: 'signUp',
                                  child: Text(
                                    'SignUp',
                                    style: TextStyle(
                                      color: orangeColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ))
                          ],
                        ),
                        const SizedBox(
                          height: 240,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
        }
      },
    );
  }
}
