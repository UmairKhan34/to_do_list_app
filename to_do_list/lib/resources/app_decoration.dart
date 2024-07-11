import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AppDecoration {
  InputDecoration decoration({
    Widget? suffixIcon,
    Widget? prefixIcon,
    required String hint,
    TextStyle? textStyle,
    required double radius,
    required Color fillcolor,
    required Color borderColor,
    bool? filled,
  }) {
    return InputDecoration(
      fillColor: fillcolor,
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      contentPadding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 5.w),
      hintStyle: textStyle,
      hintText: hint,
      filled: filled,
      border: OutlineInputBorder(
        borderSide: BorderSide(color: borderColor),
        borderRadius: BorderRadius.all(Radius.circular(radius)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: borderColor),
        borderRadius: BorderRadius.all(Radius.circular(radius)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: borderColor),
        borderRadius: BorderRadius.all(Radius.circular(radius)),
      ),
    );
  }
}
