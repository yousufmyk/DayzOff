import 'package:dayzoff/constants/appConstants.dart';
import 'package:dayzoff/repo/authRepo.dart';
import 'package:dayzoff/screens/auth/registerScreen.dart';
import 'package:dayzoff/styles/appTextStyle.dart';
import 'package:dayzoff/widgets/appButtonWidget.dart';
import 'package:dayzoff/widgets/authTextFiedlWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              60.height,
              const CircleAvatar(
                radius: 50,
                backgroundColor: Colors.transparent,
                backgroundImage: NetworkImage(personImage),
              ),
              50.height,
              Text(
                'Employee Login',
                style: appstyle(30, Colors.white, FontWeight.bold),
              ),
              14.height,
               AuthTextField(
                hintText: 'Email',
                
              ),
              20.height,
               AuthTextField(
                isPassword: true,
                hintText: 'Password',
                
              ),
              10.height,
              Text(
                'Forgot Password?',
                style: appstyle(12, Colors.white, FontWeight.w200),
              ),
              30.height,
              CustomAppButton(
                text: 'LOGIN',
                color: const Color(0xffff893c),
                ontap: () {
                  
                },
              ),
              20.height,
              CustomAppButton(
                text: 'REGISTER',
                color: const Color.fromARGB(104, 255, 255, 255),
                ontap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  RegisterScreen()));
                  

                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
