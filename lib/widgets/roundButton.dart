import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({
    super.key, this.ontap, this.icon,
  });
final VoidCallback? ontap;
final Icon? icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(36),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      height: 40,
      width: 42,
      child: Center(
          child: IconButton(
              onPressed: ontap, icon: icon ?? const Icon(Icons.arrow_back_ios,color: Colors.black,))),
    );
  }
}
