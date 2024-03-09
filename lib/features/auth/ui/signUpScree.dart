import 'package:dayzoff/features/auth/bloc/auth_bloc.dart';
import 'package:dayzoff/features/widgets/authButton.dart';
import 'package:dayzoff/features/widgets/authTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController preferrednameController = TextEditingController();
  final TextEditingController eIDController = TextEditingController();
  final TextEditingController departmentController = TextEditingController();
  final TextEditingController phoneNumController = TextEditingController();
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
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: SingleChildScrollView(
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(Icons.arrow_back_ios_new_rounded)),
                    ),
                    const Text(
                      'Create Account',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    //  SizedBox(
                    //   height: 20,
                    // ),
                    const Text(
                      'Please fill the input below here',
                      style: TextStyle(

                          //fontWeight: FontWeight.w200,
                          ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    AuthTextField(
                      controller: fullnameController,
                      icon: const Icon(Icons.abc_rounded),
                      hintText: 'full name',
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    AuthTextField(
                      controller: preferrednameController,
                      icon: const Icon(Icons.abc_rounded),
                      hintText: 'preferred name',
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    AuthTextField(
                      controller: eIDController,
                      icon: const Icon(Icons.workspace_premium),
                      hintText: 'employe ID',
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    AuthTextField(
                      controller: departmentController,
                      icon: const Icon(Icons.work_outline_rounded),
                      hintText: 'department',
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    AuthTextField(
                      controller: phoneNumController,
                      icon: const Icon(Icons.numbers_rounded),
                      hintText: 'phone number',
                    ),
                    const SizedBox(
                      height: 16,
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
                    const AuthTextField(
                      icon: Icon(Icons.password_rounded),
                      hintText: 'confirm password',
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Hero(
                      flightShuttleBuilder: (flightContext, animation,
                          flightDirection, fromHeroContext, toHeroContext) {
                        switch (flightDirection) {
                          case HeroFlightDirection.push:
                            return Material(
                              color: Colors.transparent,
                              child: ScaleTransition(
                                scale: animation.drive(
                                    Tween<double>(begin: 0.0, end: 1.0).chain(
                                  CurveTween(curve: Curves.fastOutSlowIn),
                                )),
                                child: toHeroContext.widget,
                              ),
                            );

                          case HeroFlightDirection.pop:
                            return Material(
                              color: Colors.transparent,
                              child: fromHeroContext.widget,
                            );
                        }
                      },
                      tag: 'signUp',
                      child: AuthButton(
                        onTap: () async {
                          authBloc.add(SignUpEvent(
                            fullName: fullnameController.text,
                            preferredName: preferrednameController.text,
                            employeID: eIDController.text,
                            department: departmentController.text,
                            phoneNum: phoneNumController.text,
                            email: emailController.text,
                            password: passwordController.text,
                          ));
                        },
                        text: 'SIGN UP',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
