import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groceryitems/resources/app_localization.dart';
import 'package:groceryitems/resources/resources.dart';
import 'package:groceryitems/src/auth/view_model/auth_vm.dart';
import 'package:groceryitems/utilis/field_validations.dart';
import 'package:groceryitems/utilis/heights_widths.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class EditProfileView extends StatefulWidget {
  static String route = "/editprofile";
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  String name = '';
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  FocusNode firstNameNode = FocusNode();
  FocusNode lastNameNode = FocusNode();
  TextEditingController emailController = TextEditingController();
  FocusNode emailNode = FocusNode();
  final ImagePicker picker = ImagePicker();
  XFile? _selectedImageGallery;
  @override
  void initState() {
    super.initState();
    var authVm = Provider.of<AuthVM>(context, listen: false);
    firstNameController.text = authVm.userModel.name ?? '';
    lastNameController.text = authVm.userModel.lastName ?? "";
    emailController.text = authVm.userModel.email ?? "";
    _selectedImageGallery = authVm.userModel.image;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthVM>(
        builder: (context, authVm, child) => Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Text('cancel'.L(),
                    style: R.textStyle.textSfProRegular(
                        weight: FontWeight.w400,
                        size: 14.sp,
                        decoration: TextDecoration.none,
                        color: R.colors.navigationColor)),
              ),
              actions: [
                GestureDetector(
                  onTap: () {
                    authVm.addUserDetail(
                        firstNameController.text,
                        lastNameController.text,
                        _selectedImageGallery,
                        emailController.text);

                    authVm.update();
                    setState(() {});
                    if (kDebugMode) {
                      print(authVm.userModel.image);
                    }
                    Get.back();
                  },
                  child: Text(
                    'done'.L(),
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
            body: Column(children: [
              h3,
              Row(
                children: [
                  w3,
                  Column(
                    children: [
                      h3,
                      _selectedImageGallery != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.file(
                                File(_selectedImageGallery!.path),
                                width: 26.w,
                                height: 12.h,
                                fit: BoxFit.cover,
                              ),
                            )
                          : Image.asset(
                              R.images.profile,
                              height: 8.h,
                              width: 21.w,
                            ),
                      h1,
                      GestureDetector(
                        onTap: () async {
                          final XFile? image = await picker.pickImage(
                              source: ImageSource.gallery);
                          if (image != null) {
                            setState(() {
                              _selectedImageGallery = image;
                            });
                          }
                        },
                        child: Text(
                          'edit'.L(),
                          style: R.textStyle.textSfProRegular(
                              weight: FontWeight.w400,
                              size: 12.sp,
                              decoration: TextDecoration.none,
                              color: R.colors.textEditColor),
                        ),
                      )
                    ],
                  ),
                  Flexible(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.only(left: 5.w),
                      child: Column(
                        children: [
                          firstNameTextFormField(),
                          h1,
                          lastNameTextFormField(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                  padding: EdgeInsets.only(left: 5.w),
                  child: emailTextForm(authVm))
            ])));
  }

  Widget firstNameTextFormField() {
    return TextFormField(
      textInputAction: TextInputAction.next,
      controller: firstNameController,
      focusNode: firstNameNode,
      textCapitalization: TextCapitalization.words,
      validator: (value) {
        return FieldValidator.validateFullName(value);
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      buildCounter: (context,
              {required currentLength, required isFocused, maxLength}) =>
          null,
      maxLength: 8,
    );
  }

  Widget lastNameTextFormField() {
    return TextFormField(
      controller: lastNameController,
      focusNode: lastNameNode,
      textCapitalization: TextCapitalization.words,
      validator: (value) {
        return FieldValidator.validateFullName(value);
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      buildCounter: (context,
              {required currentLength, required isFocused, maxLength}) =>
          null,
      maxLength: 8,
    );
  }

  Widget emailTextForm(AuthVM authVm) {
    return TextFormField(
      controller: emailController,
      focusNode: emailNode,
      textCapitalization: TextCapitalization.words,
      validator: (value) {
        return FieldValidator.validateEmail(value);
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      decoration: InputDecoration(
        hintText: authVm.userModel.email,
        hintStyle: R.textStyle.textSfProRegular(
            weight: FontWeight.w500,
            size: 14.sp,
            decoration: TextDecoration.none,
            color: R.colors.primarayTextColor),
      ),
    );
  }
}
