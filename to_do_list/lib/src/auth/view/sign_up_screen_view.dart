import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groceryitems/resources/app_localization.dart';
import 'package:groceryitems/resources/resources.dart';
import 'package:groceryitems/src/auth/view/login_screen_view.dart';
import 'package:groceryitems/utilis/auth_button.dart';
import 'package:groceryitems/utilis/connect_with.dart';
import 'package:groceryitems/utilis/field_validations.dart';
import 'package:groceryitems/utilis/heights_widths.dart';
import 'package:sizer/sizer.dart';

class SignUpScreenView extends StatefulWidget {
  static String route = "/signupscreen";

  const SignUpScreenView({super.key});

  @override
  State<SignUpScreenView> createState() => _SignUpScreenViewState();
}

class _SignUpScreenViewState extends State<SignUpScreenView> {
  TextEditingController nameController = TextEditingController();
  FocusNode nameNode = FocusNode();
  TextEditingController emailController = TextEditingController();
  FocusNode emailNode = FocusNode();
  TextEditingController passwordController = TextEditingController();
  FocusNode passwordNode = FocusNode();
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
                    R.images.signupBg,
                  ),
                )),
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 2.5.w),
              child: Column(
                children: [
                  h20,
                  Text(
                    'create_a_new_account'.L(),
                    textAlign: TextAlign.center,
                    style: R.textStyle.sfProDisplay(
                        weight: FontWeight.w400,
                        size: 30.sp,
                        decoration: TextDecoration.none,
                        color: R.colors.white),
                  ),
                  h3,
                  nameTextFormField(),
                  h2,
                  emailTextFormField(),
                  h2,
                  passwordTextFormField(),
                  h3,
                  AuthButton(
                      height: 7.h,
                      width: 92.w,
                      title: 'create_an_account'.L(),
                      onpress: () {
                        if (_formKey.currentState!.validate()) {
                          Get.back();
                        }
                      }),
                  h3,
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: 'already_a_member'.L(),
                            style: R.textStyle.textSfProRegular(
                                weight: FontWeight.w400,
                                size: 12.sp,
                                decoration: TextDecoration.none,
                                color: R.colors.white.withOpacity(.6))),
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.offAllNamed(LoginScreenView.route);
                              },
                            text: 'sign_in'.L(),
                            style: R.textStyle.textSfProRegular(
                                weight: FontWeight.w400,
                                size: 14.sp,
                                decoration: TextDecoration.none,
                                color: R.colors.white)),
                      ],
                    ),
                  ),
                  h8,
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
    );
  }

  Widget nameTextFormField() {
    return TextFormField(
        onTap: () {
          setState(() {});
        },
        onEditingComplete: () {
          FocusScope.of(context).requestFocus(emailNode);
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
        keyboardType: TextInputType.name,
        obscureText: false,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          return FieldValidator.validateFullName(value);
        },
        controller: nameController,
        focusNode: nameNode,
        decoration: R.fieldDecoration.decoration(
            borderColor: R.colors.gray.withOpacity(.9),
            textStyle: R.textStyle.textSfProRegular(
                weight: FontWeight.w400,
                size: 11.sp,
                decoration: TextDecoration.none,
                color: R.colors.white),
            hint: LocalizationMap.getValues('name'),
            radius: 15,
            fillcolor: R.colors.white.withOpacity(.5),
            filled: true));
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
        validator: (value) {
          return FieldValidator.validateEmail(value);
        },
        controller: emailController,
        focusNode: emailNode,
        decoration: R.fieldDecoration.decoration(
            borderColor: R.colors.gray.withOpacity(.9),
            textStyle: R.textStyle.textSfProRegular(
                weight: FontWeight.w400,
                size: 11.sp,
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
                size: 11.sp,
                decoration: TextDecoration.none,
                color: R.colors.white),
            hint: 'password'.L(),
            radius: 15,
            fillcolor: R.colors.white.withOpacity(.5),
            filled: true));
  }
}
