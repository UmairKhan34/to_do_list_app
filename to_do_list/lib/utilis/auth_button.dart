import 'package:flutter/material.dart';
import 'package:groceryitems/resources/resources.dart';
import 'package:sizer/sizer.dart';

class AuthButton extends StatelessWidget {
  final String title;
  final VoidCallback onpress;
  final double? height;
  final double? width;
  const AuthButton(
      {super.key,
      required this.title,
      required this.onpress,
      this.height,
      this.width});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: Container(
        decoration: BoxDecoration(
          color: R.colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        height: height,
        width: width,
        child: Center(
            child: Text(title,
                style: R.textStyle.textSfProBold(
                    weight: FontWeight.w500,
                    size: 14.sp,
                    decoration: TextDecoration.none,
                    color: R.colors.primarayTextColor))),
      ),
    );
  }
}
