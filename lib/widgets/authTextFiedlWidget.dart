import 'package:dayzoff/constants/appConstants.dart';
import 'package:dayzoff/styles/appTextStyle.dart';
import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    this.hintText,
    this.height,
    this.width,
    this.radius, 
    this.isPassword,
    this.label,
    this.controller,
  });
  final String? hintText;
  final double? height;
  final double? width;
  final double? radius;
  final bool? isPassword;
  final String? label;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label??'',style: appstyle(14, Colors.white, FontWeight.normal),),
        Container(
          height: height ?? 60,
          width: width ?? 320,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius ?? 16),
              color: textFieldbackgroundColor),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: TextField(
              controller: controller,
              obscureText: isPassword ?? false,
              obscuringCharacter: '•',
              decoration: InputDecoration(
                  
                  border: InputBorder.none,
                  hintText: hintText,
                  hintStyle:  appstyle(14, hintTextColor, FontWeight.normal)),
            ),
          ),
        ),
      ],
    );
  }
}
