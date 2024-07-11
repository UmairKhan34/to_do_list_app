import 'package:flutter/material.dart';
import 'package:groceryitems/resources/resources.dart';
import 'package:sizer/sizer.dart';

class AppTextStyle {
  TextStyle textSfProRegular({
    Color? color,
    FontWeight? weight,
    double? size,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      fontFamily: 'SFProText-Regular',
      fontWeight: weight ?? FontWeight.w400,
      fontSize: size ?? 14.sp,
      decoration: decoration ?? TextDecoration.none,
      color: color ?? R.colors.primarayTextColor,
    );
  }

  TextStyle textSfProMedium(
      {FontWeight? weight,
      double? size,
      TextDecoration? decoration,
      Color? color}) {
    return TextStyle(
      fontFamily: 'SFProText-Medium',
      fontWeight: weight ?? FontWeight.w400,
      fontSize: size ?? 14.sp,
      decoration: decoration ?? TextDecoration.none,
      color: color ?? R.colors.primarayTextColor,
    );
  }

  TextStyle textSfProBold(
      {FontWeight? weight,
      double? size,
      TextDecoration? decoration,
      Color? color}) {
    return TextStyle(
      fontFamily: 'SFProText-Bold',
      fontWeight: weight ?? FontWeight.w400,
      fontSize: size ?? 16.sp,
      decoration: decoration ?? TextDecoration.none,
      color: color ?? R.colors.primarayTextColor,
    );
  }

  TextStyle sfProDisplay(
      {FontWeight? weight,
      double? size,
      TextDecoration? decoration,
      Color? color}) {
    return TextStyle(
      fontFamily: ' SF-Pro-Display-Regular',
      fontWeight: weight ?? FontWeight.w400,
      fontSize: size ?? 16.sp,
      decoration: decoration ?? TextDecoration.none,
      color: color ?? R.colors.primarayTextColor,
    );
  }
}
