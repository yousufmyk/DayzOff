import 'package:dayzoff/styles/appTextStyle.dart';
import 'package:flutter/material.dart';

class CustomAppButton extends StatelessWidget {
   const CustomAppButton({
    super.key,required this.text, this.color, required this.ontap,
  });
final String? text;
final Color? color;
final VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(36),
            color: color,
            ),
        height: 70,
        width: 320,
        child: Center(
          child: Text(text ?? '',
              style: appstyle(28, Colors.white, FontWeight.w500)),
        ),
      ),
    );
  }
}