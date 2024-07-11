import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:groceryitems/resources/app_localization.dart';
import 'package:groceryitems/resources/resources.dart';
import 'package:groceryitems/utilis/auth_button.dart';
import 'package:groceryitems/utilis/field_validations.dart';
import 'package:groceryitems/utilis/heights_widths.dart';
import 'package:sizer/sizer.dart';

class ForgotPasswordView extends StatefulWidget {
  static String route = "/forgotpassword";
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  TextEditingController passwordContoller = TextEditingController();
  FocusNode passwordNode = FocusNode();
  TextEditingController verifyContoller = TextEditingController();
  FocusNode verifyNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
            // width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                color: R.colors.primarayTextColor,
                image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                    R.colors.gray.withOpacity(1),
                    BlendMode.modulate,
                  ),
                  fit: BoxFit.cover,
                  image: AssetImage(
                    R.images.forgotBg,
                  ),
                )),
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 2.5.w),
              child: Column(
                children: [
                  h25,
                  Text(
                    'set_a_new_password'.L(),
                    textAlign: TextAlign.center,
                    style: R.textStyle.sfProDisplay(
                        weight: FontWeight.w400,
                        size: 28.sp,
                        decoration: TextDecoration.none,
                        color: R.colors.white),
                  ),
                  h5,
                  passwordTextFormField(),
                  h2,
                  verifyPasswordTextFormField(),
                  h5,
                  AuthButton(
                      height: 7.h,
                      width: 92.w,
                      title: 'reset_password'.L(),
                      onpress: () {
                        if (_formKey.currentState!.validate()) {
                          Get.back();
                        }
                      })
                ],
              ),
            )),
      ),
    );
  }

  Widget passwordTextFormField() {
    return TextFormField(
        style: R.textStyle.textSfProRegular(
            weight: FontWeight.w400,
            size: 12.sp,
            decoration: TextDecoration.none,
            color: R.colors.white),
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        onTap: () {
          setState(() {});
        },
        onEditingComplete: () {
          FocusScope.of(context).requestFocus(verifyNode);
        },
        onFieldSubmitted: (value) {},
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.visiblePassword,
        obscureText: false,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: FieldValidator.validatePassword,
        controller: passwordContoller,
        focusNode: passwordNode,
        decoration: R.fieldDecoration.decoration(
            borderColor: R.colors.gray.withOpacity(.9),
            textStyle: R.textStyle.textSfProRegular(
                weight: FontWeight.w400,
                size: 11.sp,
                decoration: TextDecoration.none,
                color: R.colors.white),
            hint: 'new_password'.L(),
            radius: 15,
            fillcolor: R.colors.white.withOpacity(.5),
            filled: true));
  }

  Widget verifyPasswordTextFormField() {
    return TextFormField(
        onTap: () {
          setState(() {});
        },
        onEditingComplete: () {
          // FocusScope.of(context).requestFocus(verifyNode);
        },
        onFieldSubmitted: (value) {},
        style: R.textStyle.textSfProRegular(
            weight: FontWeight.w400,
            size: 12.sp,
            decoration: TextDecoration.none,
            color: R.colors.white),
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        textInputAction: TextInputAction.done,
        keyboardType: TextInputType.visiblePassword,
        obscureText: false,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          return FieldValidator.validatePasswordMatch(
              value, passwordContoller.text);
        },
        controller: verifyContoller,
        focusNode: verifyNode,
        decoration: R.fieldDecoration.decoration(
            borderColor: R.colors.gray.withOpacity(.9),
            textStyle: R.textStyle.textSfProRegular(
                weight: FontWeight.w400,
                size: 11.sp,
                decoration: TextDecoration.none,
                color: R.colors.white),
            hint: 'verify'.L(),
            radius: 15,
            fillcolor: R.colors.white.withOpacity(.5),
            filled: true));
  }
}
