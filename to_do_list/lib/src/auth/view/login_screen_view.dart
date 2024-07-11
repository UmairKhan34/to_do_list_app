import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groceryitems/resources/app_localization.dart';
import 'package:groceryitems/resources/resources.dart';
import 'package:groceryitems/src/auth/view/forgot_password_view.dart';
import 'package:groceryitems/src/auth/view/sign_up_screen_view.dart';
import 'package:groceryitems/src/auth/view_model/auth_vm.dart';
import 'package:groceryitems/src/base/view/base_view.dart';
import 'package:groceryitems/utilis/auth_button.dart';
import 'package:groceryitems/utilis/connect_with.dart';
import 'package:groceryitems/utilis/field_validations.dart';
import 'package:groceryitems/utilis/heights_widths.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class LoginScreenView extends StatefulWidget {
  static String route = "/loginscreen";
  const LoginScreenView({super.key});

  @override
  State<LoginScreenView> createState() => _LoginScreenViewState();
}

class _LoginScreenViewState extends State<LoginScreenView> {
  TextEditingController emailController = TextEditingController();
  FocusNode emailNode = FocusNode();
  TextEditingController passwordController = TextEditingController();
  FocusNode passwordNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthVM>(
        builder: (context, authVm, child) => Scaffold(
              body: Form(
                key: _formKey,
                child: Container(
                    height: double.infinity,
                    decoration: BoxDecoration(
                        color: R.colors.primarayTextColor,
                        image: DecorationImage(
                          colorFilter: ColorFilter.mode(
                            R.colors.lightGray.withOpacity(.5),
                            BlendMode.modulate,
                          ),
                          fit: BoxFit.cover,
                          image: AssetImage(
                            R.images.loginBg,
                          ),
                        )),
                    child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(horizontal: 2.5.w),
                      child: Column(
                        children: [
                          h20,
                          Text(
                            'sign_in_to_your_account'.L(),
                            textAlign: TextAlign.center,
                            style: R.textStyle.sfProDisplay(
                                weight: FontWeight.w400,
                                size: 30.sp,
                                decoration: TextDecoration.none,
                                color: R.colors.white),
                          ),
                          h3,
                          emailTextFormField(),
                          h2,
                          passwordTextFormField(),
                          h2,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(ForgotPasswordView.route);
                                },
                                child: Text(
                                  'forgot_your_password'.L(),
                                  style: R.textStyle.textSfProRegular(
                                      weight: FontWeight.w400,
                                      size: 12.sp,
                                      decoration: TextDecoration.none,
                                      color: R.colors.white.withOpacity(.6)),
                                ),
                              )
                            ],
                          ),
                          h3,
                          AuthButton(
                              height: 7.h,
                              width: 92.w,
                              title: 'sign_in'.L(),
                              onpress: () {
                                if (_formKey.currentState!.validate()) {
                                  authVm.userModel.email = emailController.text;
                                  Get.offAllNamed(BaseView.route);
                                } else {
                                  log('invalid');
                                }
                              }),
                          h3,
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                    text: 'not_yet_a_member'.L(),
                                    style: R.textStyle.textSfProRegular(
                                        weight: FontWeight.w400,
                                        size: 12.sp,
                                        decoration: TextDecoration.none,
                                        color: R.colors.white.withOpacity(.6))),
                                TextSpan(
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Get.toNamed(SignUpScreenView.route);
                                      },
                                    text: 'sign_up'.L(),
                                    style: R.textStyle.textSfProRegular(
                                        weight: FontWeight.w400,
                                        size: 12.sp,
                                        decoration: TextDecoration.none,
                                        color: R.colors.white)),
                              ],
                            ),
                          ),
                          h10,
                          Text(
                            'or_connect_with'.L(),
                            style: R.textStyle.textSfProRegular(
                                weight: FontWeight.w400,
                                size: 12.sp,
                                decoration: TextDecoration.none,
                                color: R.colors.white.withOpacity(.6)),
                          ),
                          h3,
                          const ConnectWith()
                        ],
                      ),
                    )),
              ),
            ));
  }

  Widget emailTextFormField() {
    return TextFormField(
        onTap: () {
          setState(() {});
        },
        onEditingComplete: () {
          FocusScope.of(context).requestFocus(passwordNode);
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
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.emailAddress,
        obscureText: false,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: FieldValidator.validateEmail,
        controller: emailController,
        focusNode: emailNode,
        decoration: R.fieldDecoration.decoration(
            borderColor: R.colors.gray.withOpacity(.9),
            textStyle: R.textStyle.textSfProRegular(
                weight: FontWeight.w400,
                size: 12.sp,
                decoration: TextDecoration.none,
                color: R.colors.white),
            hint: 'email'.L(),
            radius: 15,
            fillcolor: R.colors.white.withOpacity(.5),
            filled: true));
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
        textInputAction: TextInputAction.done,
        keyboardType: TextInputType.visiblePassword,
        obscureText: false,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          return FieldValidator.validatePassword(value);
        },
        controller: passwordController,
        focusNode: passwordNode,
        decoration: R.fieldDecoration.decoration(
            borderColor: R.colors.gray.withOpacity(.9),
            textStyle: R.textStyle.textSfProRegular(
                weight: FontWeight.w400,
                size: 12.sp,
                decoration: TextDecoration.none,
                color: R.colors.white),
            hint: 'password'.L(),
            radius: 15,
            fillcolor: R.colors.white.withOpacity(.5),
            filled: true));
  }

  Widget connectWith() {
    return Container(
      height: 7.h,
      width: 85.w,
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
