import 'package:dayzoff/constants/appConstants.dart';
import 'package:dayzoff/repo/authRepo.dart';
import 'package:dayzoff/styles/appTextStyle.dart';
import 'package:dayzoff/widgets/appButtonWidget.dart';
import 'package:dayzoff/widgets/authTextFiedlWidget.dart';
import 'package:dayzoff/widgets/roundButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';

class RegisterScreen extends StatelessWidget {
   RegisterScreen({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.height,
               RoundButton(
                ontap: () => Navigator.pop(context),
              ),
              20.height,
              Text(
                'Welcome \nTo DayzOff',
                style: appstyle(40, Colors.white, FontWeight.bold),
              ),
              10.height,
              Text(
                "Let's Start by getting your DayzOff account setup",
                style: appstyle(13, Colors.white, FontWeight.w600),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      14.height,
                      const AuthTextField(
                        label: 'Department*',
                        hintText: 'Department',
                      ),
                      14.height,
                      const AuthTextField(
                        label: 'Employee ID*',
                        hintText: 'Employee ID',
                      ),
                      14.height,
                      const AuthTextField(
                        label: 'First Name*',
                        hintText: 'First Name',
                      ),
                      14.height,
                      const AuthTextField(
                        label: 'Last Name*',
                        hintText: 'Last Name',
                      ),
                      14.height,
                       AuthTextField(
                        label: 'Email*',
                        hintText: 'Email',
                        controller: emailController,
                      ),
                      14.height,
                       AuthTextField(
                        label: 'Password*',
                        hintText: 'Password',
                        isPassword: true,
                        controller: passwordController,
                      ),
                      14.height,
                      const AuthTextField(
                        label: 'Confirm Password*',
                        hintText: 'Confirm Password',
                        isPassword: true,
                      ),
                      115.height,
                      Text(
                        'Forgot Password?',
                        style: appstyle(12, Colors.white, FontWeight.w200),
                      ),
                      30.height,
                    ],
                  ),
                ),
              ),
              10.height,
              CustomAppButton(
                text: 'LOGIN',
                color: const Color(0xffff893c),
                ontap: () async{
                 await RepositoryProvider.of<AuthRepo>(context).signup(email: emailController.text.toString(), password: passwordController.text.toString());
                },
              ),
              // 20.height,
              // CustomAppButton(
              //   text: 'REGISTER',
              //   color: const Color.fromARGB(104, 255, 255, 255),
              //   ontap: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => const RegisterScreen()));

              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

