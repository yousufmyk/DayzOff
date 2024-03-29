import 'package:dayzoff/features/constants/constants.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    required this.onTap,
    required this.text,
    this.radious,
  });

  final String text;
  final VoidCallback onTap;
  final double? radious;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radious ?? 25),
          color: orangeColor,
        ),
        child: Center(
            child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            //color: Colors.white,
            fontSize: 20,
          ),
        )),
      ),
    );
  }
}
