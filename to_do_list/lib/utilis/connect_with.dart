import 'package:flutter/material.dart';
import 'package:groceryitems/resources/resources.dart';
import 'package:sizer/sizer.dart';

class ConnectWith extends StatelessWidget {
  const ConnectWith({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 7.h,
      width: 80.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: R.colors.gray.withOpacity(.9),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            R.images.google,
            scale: 3.5,
          ),
          Text(
            'Google',
            style: R.textStyle.textSfProRegular(
                weight: FontWeight.w400,
                size: 12.sp,
                decoration: TextDecoration.none,
                color: R.colors.white.withOpacity(.9)),
          ),
          VerticalDivider(
            color: R.colors.white.withOpacity(.3),
          ),
          Image.asset(
            R.images.facebook,
            scale: 3.5,
          ),
          Text(
            'FaceBook',
            style: R.textStyle.textSfProRegular(
                weight: FontWeight.w400,
                size: 12.sp,
                decoration: TextDecoration.none,
                color: R.colors.white.withOpacity(.9)),
          ),
        ],
      ),
    );
  }
}
