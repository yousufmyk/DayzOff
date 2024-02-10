import 'package:dayzoff/features/constants/constants.dart';
import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    required this.hintText,required this.icon,  this.controller,
  });

  final String? hintText;
  final Icon? icon;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: orangeColor,
      decoration: InputDecoration(
        prefixIcon: icon,
        prefixIconColor: grayColor,
        //fillColor: const Color.fromARGB(132, 255, 255, 255),
        focusColor: Colors.orange,
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: orangeColor,
            ),
            borderRadius: BorderRadius.circular(12)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: dimgrayColor,
          fontWeight: FontWeight.w500,
        ),
        alignLabelWithHint: true,
      ),
    );
  }
}
