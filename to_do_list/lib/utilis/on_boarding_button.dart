import 'package:flutter/material.dart';
import 'package:groceryitems/resources/resources.dart';
import 'package:sizer/sizer.dart';

class OnBoardingButton extends StatelessWidget {
  final String title;

  final VoidCallback onpress;
  final double? height;
  final double? width;
  const OnBoardingButton({
    super.key,
    required this.title,
    required this.onpress,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: Container(
        decoration: BoxDecoration(
            color: R.colors.white.withOpacity(.5),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  blurRadius: 15,
                  spreadRadius: 0,
                  blurStyle: BlurStyle.inner,
                  color: R.colors.primarayTextColor)
            ]),
        height: height,
        width: width,
        child: Center(
            child: Text(title,
                style: R.textStyle.textSfProMedium(
                    weight: FontWeight.w500,
                    size: 14.sp,
                    decoration: TextDecoration.none,
                    color: R.colors.white))),
      ),
    );
  }
}
