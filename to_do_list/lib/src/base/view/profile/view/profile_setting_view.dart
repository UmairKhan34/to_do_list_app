import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groceryitems/resources/app_localization.dart';
import 'package:groceryitems/resources/resources.dart';
import 'package:groceryitems/src/auth/view_model/auth_vm.dart';
import 'package:groceryitems/src/base/view/profile/view/change_password_view.dart';
import 'package:groceryitems/src/base/view/profile/view/language_screen_view.dart';
import 'package:groceryitems/src/base/view/profile/view/profile_view.dart';
import 'package:groceryitems/utilis/heights_widths.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ProfileSettingView extends StatefulWidget {
  const ProfileSettingView({super.key});

  @override
  State<ProfileSettingView> createState() => _ProfileSettingViewState();
}

class _ProfileSettingViewState extends State<ProfileSettingView> {
  bool _isMoving = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthVM>(
        builder: (context, authVm, child) => Scaffold(
              backgroundColor: R.colors.whiteSmoke.withOpacity(1),
              body: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        height: 25.h,
                        child: Container(
                          padding: EdgeInsets.only(left: 5.w),
                          height: 26.4.h,
                          width: double.infinity,
                          decoration: BoxDecoration(color: R.colors.white),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              h7,
                              Text(
                                'settings'.L(),
                                style: R.textStyle.sfProDisplay(
                                    weight: FontWeight.bold,
                                    size: 30.sp,
                                    decoration: TextDecoration.none,
                                    color: R.colors.primarayTextColor),
                              ),
                              h2,
                              ListTile(
                                onTap: () {
                                  Get.toNamed(ProfileView.route);
                                },
                                leading: authVm.userModel.image?.path != null
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: Image.file(
                                          File(authVm.userModel.image?.path ??
                                              R.images.profile),
                                          width: 14.w,
                                          height: 6.h,
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    : Image.asset(
                                        R.images.profile,
                                        scale: 2,
                                      ),
                                title: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      authVm.userModel.name ?? "Shawn",
                                      style: R.textStyle.sfProDisplay(
                                          weight: FontWeight.w600,
                                          size: 16.sp,
                                          decoration: TextDecoration.none,
                                          color: R.colors.primarayTextColor),
                                    ),
                                    w1,
                                    Text(
                                      authVm.userModel.lastName ?? "Howard",
                                      style: R.textStyle.sfProDisplay(
                                          weight: FontWeight.w600,
                                          size: 16.sp,
                                          decoration: TextDecoration.none,
                                          color: R.colors.primarayTextColor),
                                    ),
                                  ],
                                ),
                                subtitle: Text(
                                  authVm.userModel.email ?? "",
                                  style: R.textStyle.textSfProRegular(
                                      weight: FontWeight.w400,
                                      size: 12.sp,
                                      decoration: TextDecoration.none,
                                      color: R.colors.primarayTextColor
                                          .withOpacity(.48)),
                                ),
                                trailing: Image.asset(
                                  R.images.forward,
                                  scale: 3.5,
                                ),
                              )
                            ],
                          ),
                        )),
                    h3,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                      child: Text(
                        'notification'.L(),
                        style: R.textStyle.textSfProRegular(
                            weight: FontWeight.w400,
                            size: 12.sp,
                            decoration: TextDecoration.none,
                            color: R.colors.primarayTextColor.withOpacity(.48)),
                      ),
                    ),
                    h2,
                    commonContainer(
                        'send_push_notification'.L(),
                        Switch(
                            activeColor: R.colors.white,
                            activeTrackColor: R.colors.ghostWhite,
                            inactiveThumbColor: R.colors.gray.withOpacity(.2),
                            inactiveTrackColor: R.colors.white,
                            value: _isMoving,
                            onChanged: (bool value) {
                              setState(() {
                                _isMoving = value;
                              });
                            }),
                        () {},
                        true),
                    h2,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                      child: Text(
                        'support'.L(),
                        style: R.textStyle.textSfProRegular(
                            weight: FontWeight.w400,
                            size: 12.sp,
                            decoration: TextDecoration.none,
                            color: R.colors.primarayTextColor.withOpacity(.48)),
                      ),
                    ),
                    h2,
                    commonContainer(
                        'privacy_policy'.L(),
                        Image.asset(
                          R.images.forward,
                          scale: 3.5,
                        ),
                        () {},
                        true),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Divider(
                        color: R.colors.primarayTextColor.withOpacity(.2),
                        height: 0.5,
                        thickness: 0.5,
                      ),
                    ),
                    commonContainer(
                        'contact_support'.L(),
                        Image.asset(
                          R.images.forward,
                          scale: 3.5,
                        ),
                        () {},
                        true),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Divider(
                        color: R.colors.primarayTextColor.withOpacity(.2),
                        height: 0.5,
                        thickness: 0.5,
                      ),
                    ),
                    commonContainer(
                        'faq'.L(),
                        Image.asset(
                          R.images.forward,
                          scale: 3.5,
                        ),
                        () {},
                        true),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Divider(
                        color: R.colors.primarayTextColor.withOpacity(.2),
                        height: 0.5,
                        thickness: 0.5,
                      ),
                    ),
                    commonContainer(
                        'send_feedback'.L(),
                        Image.asset(
                          R.images.forward,
                          scale: 3.5,
                        ),
                        () {},
                        true),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Divider(
                        color: R.colors.primarayTextColor.withOpacity(.2),
                        height: 0.5,
                        thickness: 0.5,
                      ),
                    ),
                    commonContainer(
                        'change_password'.L(),
                        Image.asset(
                          R.images.forward,
                          scale: 3.5,
                        ), () {
                      Get.toNamed(ChangePasswordView.route);
                    }, true),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Divider(
                        color: R.colors.primarayTextColor.withOpacity(.2),
                        height: 0.5,
                        thickness: 0.5,
                      ),
                    ),
                    h2,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                      child: Text(
                        'general'.L(),
                        style: R.textStyle.textSfProRegular(
                            weight: FontWeight.w400,
                            size: 12.sp,
                            decoration: TextDecoration.none,
                            color: R.colors.primarayTextColor.withOpacity(.48)),
                      ),
                    ),
                    h2,
                    commonContainer(
                        'language'.L(),
                        Image.asset(
                          R.images.forward,
                          scale: 3.5,
                        ), () {
                      Get.toNamed(LanguageScreenView.route);
                    }, false),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Divider(
                        color: R.colors.primarayTextColor.withOpacity(.2),
                        height: 0.5,
                        thickness: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }

  Widget commonContainer(
      String title, Widget widget, VoidCallback onTap, bool val) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        height: 6.7.h,
        width: double.infinity,
        color: R.colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: R.textStyle.sfProDisplay(
                  weight: FontWeight.w400,
                  size: 14.sp,
                  decoration: TextDecoration.none,
                  color: R.colors.primarayTextColor),
            ),
            Visibility(
                visible: val,
                replacement: Row(
                  children: [
                    Text(
                      'English(US)',
                      style: R.textStyle.sfProDisplay(
                          weight: FontWeight.w400,
                          size: 14.sp,
                          decoration: TextDecoration.none,
                          color: R.colors.primarayTextColor.withOpacity(.3)),
                    ),
                    Image.asset(
                      R.images.forward,
                      scale: 3.5,
                    )
                  ],
                ),
                child: widget),
          ],
        ),
      ),
    );
  }
}
