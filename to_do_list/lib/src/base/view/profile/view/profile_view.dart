import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groceryitems/resources/app_localization.dart';
import 'package:groceryitems/resources/resources.dart';
import 'package:groceryitems/src/auth/view_model/auth_vm.dart';
import 'package:groceryitems/src/base/view/profile/view/edit_profile_view.dart';
import 'package:groceryitems/utilis/heights_widths.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ProfileView extends StatefulWidget {
  static String route = "/profileview";
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthVM>(
        builder: (context, authVm, child) => Scaffold(
              backgroundColor: R.colors.ghostWhite.withOpacity(1),
              appBar: AppBar(
                backgroundColor: R.colors.white,
                automaticallyImplyLeading: false,
                centerTitle: false,
                title: Row(children: [
                  w2,
                  GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Image.asset(
                        R.images.backward,
                        scale: 3.5,
                      )),
                  w4,
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Text(
                      'back'.L(),
                      style: R.textStyle.textSfProRegular(
                          weight: FontWeight.w400,
                          size: 14.sp,
                          decoration: TextDecoration.none,
                          color: R.colors.navigationColor),
                    ),
                  ),
                ]),
                actions: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(EditProfileView.route);
                    },
                    child: Text(
                      'edit'.L(),
                      style: R.textStyle.sfProDisplay(
                          weight: FontWeight.w600,
                          size: 15.sp,
                          decoration: TextDecoration.none,
                          color: R.colors.navigationColor),
                    ),
                  ),
                  w4,
                ],
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 30.h,
                      width: double.infinity,
                      color: R.colors.white,
                      child: Column(
                        children: [
                          h3,
                          authVm.userModel.image?.path != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(70),
                                  child: Image.file(
                                    File(authVm.userModel.image?.path ??
                                        R.images.profile),
                                    width: 32.w,
                                    height: 15.h,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : Image.asset(
                                  R.images.profile,
                                  scale: 2,
                                ),
                          h1,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                authVm.userModel.name ?? "Shawn",
                                style: R.textStyle.sfProDisplay(
                                    weight: FontWeight.w600,
                                    size: 19.sp,
                                    decoration: TextDecoration.none,
                                    color: R.colors.primarayTextColor),
                              ),
                              w1,
                              Text(
                                authVm.userModel.lastName ?? "Howard",
                                style: R.textStyle.sfProDisplay(
                                    weight: FontWeight.w600,
                                    size: 19.sp,
                                    decoration: TextDecoration.none,
                                    color: R.colors.primarayTextColor),
                              ),
                            ],
                          ),
                          h1,
                          Text(
                            authVm.userModel.email ?? "",
                            style: R.textStyle.textSfProRegular(
                                weight: FontWeight.w500,
                                size: 14.sp,
                                decoration: TextDecoration.none,
                                color: R.colors.primarayTextColor),
                          ),
                        ],
                      ),
                    ),
                    h50,
                    Text(
                      "contact_us".L(),
                      style: R.textStyle.textSfProRegular(
                          weight: FontWeight.w400,
                          size: 10.sp,
                          decoration: TextDecoration.none,
                          color: R.colors.primarayTextColor.withOpacity(.4)),
                    )
                  ],
                ),
              ),
            ));
  }
}
