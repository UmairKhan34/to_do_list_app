import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groceryitems/resources/app_localization.dart';
import 'package:groceryitems/resources/resources.dart';
import 'package:groceryitems/utilis/heights_widths.dart';
import 'package:sizer/sizer.dart';

class ChangePasswordView extends StatefulWidget {
  static String route = "/changepassword";
  const ChangePasswordView({super.key});

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.white.withOpacity(.94),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Text(
            'cancel'.L(),
            style: R.textStyle.textSfProBold(
                weight: FontWeight.w400,
                size: 14.sp,
                decoration: TextDecoration.none,
                color: R.colors.navigationColor),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              // Get.back();
            },
            child: Text(
              'done'.L(),
              style: R.textStyle.textSfProBold(
                  weight: FontWeight.w500,
                  size: 14.sp,
                  decoration: TextDecoration.none,
                  color: R.colors.navigationColor),
            ),
          ),
          w3
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            width: double.infinity,
            color: R.colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                h2,
                Text(
                  'change_password'.L(),
                  style: R.textStyle.sfProDisplay(
                      weight: FontWeight.bold,
                      size: 30.sp,
                      decoration: TextDecoration.none,
                      color: R.colors.primarayTextColor),
                ),
                h1,
              ],
            ),
          ),
          h5,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Text(
              'set_a_new_passord'.L(),
              style: R.textStyle.textSfProMedium(
                  weight: FontWeight.w400,
                  size: 11.sp,
                  decoration: TextDecoration.none,
                  color: R.colors.primarayTextColor.withOpacity(.4)),
            ),
          ),
          h2,
          Container(
              height: 24.h,
              width: double.infinity,
              color: R.colors.white,
              child: Column(
                children: [
                  h1,
                  commonTextFormField(
                      'old_password'.L(),
                      InputDecoration(
                          hintStyle: R.textStyle.textSfProMedium(
                              weight: FontWeight.w400,
                              size: 14.sp,
                              decoration: TextDecoration.none,
                              color:
                                  R.colors.primarayTextColor.withOpacity(.4)),
                          hintText: 'old_password'.L(),
                          border: InputBorder.none,
                          suffixIcon: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.visibility_off,
                                color: R.colors.iconColor,
                              ))),
                      6.w,
                      TextInputAction.next),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Divider(
                      color: R.colors.primarayTextColor.withOpacity(.1),
                      height: 0.5,
                      thickness: 1,
                    ),
                  ),
                  commonTextFormField(
                      'new_password'.L(),
                      InputDecoration(
                          border: InputBorder.none,
                          hintStyle: R.textStyle.textSfProMedium(
                              weight: FontWeight.w400,
                              size: 14.sp,
                              decoration: TextDecoration.none,
                              color:
                                  R.colors.primarayTextColor.withOpacity(.4)),
                          hintText: 'required'.L()),
                      5.w,
                      TextInputAction.next),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Divider(
                      color: R.colors.primarayTextColor.withOpacity(.1),
                      height: 0.5,
                      thickness: 1,
                    ),
                  ),
                  commonTextFormField(
                      'verify'.L(),
                      InputDecoration(
                          border: InputBorder.none,
                          hintStyle: R.textStyle.textSfProMedium(
                              weight: FontWeight.w400,
                              size: 14.sp,
                              decoration: TextDecoration.none,
                              color:
                                  R.colors.primarayTextColor.withOpacity(.4)),
                          hintText: 'required'.L()),
                      23.w,
                      TextInputAction.next),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Divider(
                      color: R.colors.primarayTextColor.withOpacity(.1),
                      height: 0.5,
                      thickness: 1,
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }

  Widget commonTextFormField(String text, InputDecoration decoration,
      double width, TextInputAction textInputAction) {
    return Row(
      children: [
        w3,
        Flexible(
          flex: 1,
          child: Text(
            text,
            style: R.textStyle.textSfProBold(
                weight: FontWeight.w500,
                size: 13.sp,
                decoration: TextDecoration.none,
                color: R.colors.primarayTextColor),
          ),
        ),
        SizedBox(
          width: width,
        ),
        Flexible(
            flex: 2,
            child: TextFormField(
              onTapOutside: (event) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              textInputAction: textInputAction,
              style: R.textStyle.textSfProMedium(
                  weight: FontWeight.w400,
                  size: 14.sp,
                  decoration: TextDecoration.none,
                  color: R.colors.primarayTextColor),
              obscureText: true,
              obscuringCharacter: "*",
              decoration: decoration,
            ))
      ],
    );
  }
}
