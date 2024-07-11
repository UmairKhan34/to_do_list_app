import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groceryitems/constants/enum.dart';
import 'package:groceryitems/resources/app_localization.dart';
import 'package:groceryitems/resources/resources.dart';
import 'package:groceryitems/src/base/view/list/model/list_model.dart';
import 'package:groceryitems/src/base/view/list/view_model/list_vm.dart';
import 'package:groceryitems/utilis/heights_widths.dart';
import 'package:groceryitems/utilis/toast_message/toast_message.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class AddListView extends StatefulWidget {
  static String route = "/addlist";
  const AddListView({super.key});

  @override
  State<AddListView> createState() => _AddListViewState();
}

class _AddListViewState extends State<AddListView> {
  TextEditingController listController = TextEditingController();
  ColorChoice colorSelectChoice = ColorChoice.none;
  IconChoice iconSelectChoice = IconChoice.none;
  final _formKey = GlobalKey<FormState>();
  bool? isEdit = false;
  ListModel? listModel = ListModel();

  void handleColorChoice(ColorChoice choice) {
    setState(() {
      colorSelectChoice = choice;
    });
  }

  void handleIconChoice(IconChoice choice) {
    setState(() {
      iconSelectChoice = choice;
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      dynamic args = ModalRoute.of(context)?.settings.arguments;
      if (args != null) {
        isEdit = args["isEdit"];
        listModel = args['listModel'];
        if (listModel != null) {
          if (kDebugMode) {
            print("litModel:${listModel?.title}");
          }

          listController.text = listModel!.title ?? '';
          colorSelectChoice = listModel!.color!;
          iconSelectChoice = listModel!.icon!;
        }
      }

      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ListVM>(
        builder: (context, listVm, child) => Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Text(
                    'cancel'.L(),
                    style: R.textStyle.sfProDisplay(
                        weight: FontWeight.w400,
                        size: 14.sp,
                        decoration: TextDecoration.none,
                        color: R.colors.navigationColor),
                  ),
                ),
                actions: [
                  Form(
                    key: _formKey,
                    child: GestureDetector(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          if (colorSelectChoice == ColorChoice.none) {
                            ToastMessage.toastMessage(
                                'please_select_a_color'.L(),
                                R.colors.primarayTextColor);
                          } else if (iconSelectChoice == IconChoice.none) {
                            ToastMessage.toastMessage(
                                'please_select_an_icon'.L(),
                                R.colors.primarayTextColor);
                          } else if (listController.text.isEmpty) {
                            ToastMessage.toastMessage(
                                'please_enter_list_title'.L(),
                                R.colors.primarayTextColor);
                          } else if (isEdit == false) {
                            listModel?.title = listController.text;
                            listModel?.color = colorSelectChoice;
                            listModel?.icon = iconSelectChoice;
                            listVm.update();
                            Get.back();
                          } else if (isEdit == true) {
                            listVm.addListItems(listController.text,
                                colorSelectChoice, iconSelectChoice);
                            Get.back();
                          }
                        }
                      },
                      child: Text(
                        'done'.L(),
                        style: R.textStyle.sfProDisplay(
                            weight: FontWeight.w400,
                            size: 14.sp,
                            decoration: TextDecoration.none,
                            color: R.colors.navigationColor),
                      ),
                    ),
                  ),
                  w3
                ],
              ),
              body: SingleChildScrollView(
                padding: EdgeInsets.only(left: 5.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    h3,
                    isEdit == true
                        ? Text(
                            'add'.L(),
                            style: R.textStyle.sfProDisplay(
                                weight: FontWeight.bold,
                                size: 30.sp,
                                decoration: TextDecoration.none,
                                color: R.colors.primarayTextColor),
                          )
                        : Text(
                            'edit_list'.L(),
                            style: R.textStyle.sfProDisplay(
                                weight: FontWeight.bold,
                                size: 30.sp,
                                decoration: TextDecoration.none,
                                color: R.colors.primarayTextColor),
                          ),
                    h1,
                    listTextFormField(),
                    Divider(
                      indent: 5,
                      color: R.colors.primarayTextColor.withOpacity(.2),
                      height: 0.5,
                      thickness: 0.5,
                    ),
                    h3,
                    Text('color'.L(),
                        style: R.textStyle.textSfProBold(
                            weight: FontWeight.w500,
                            size: 16.sp,
                            decoration: TextDecoration.none,
                            color: R.colors.primarayTextColor)),
                    h1,
                    Wrap(
                      spacing: 13,
                      runSpacing: 12,
                      children: List.generate(
                        ColorChoice.values.length,
                        (index) {
                          final colorChoice = ColorChoice.values[index];
                          if (colorChoice != ColorChoice.none) {
                            return colorChoiceContainer(
                              index,
                              colorChoice,
                              colorFromChoice(colorChoice),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                    ),
                    h3,
                    Text('icon'.L(),
                        style: R.textStyle.textSfProBold(
                            weight: FontWeight.w500,
                            size: 16.sp,
                            decoration: TextDecoration.none,
                            color: R.colors.primarayTextColor)),
                    h1,
                    Wrap(
                      spacing: 13,
                      runSpacing: 12,
                      children: List.generate(
                        ColorChoice.values.length,
                        (index) {
                          final iconChoice = IconChoice.values[index];
                          if (iconChoice != IconChoice.none) {
                            return iconChoiceContainer(
                              index,
                              iconChoice,
                              iconFromChoice(iconChoice),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }

  Widget listTextFormField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      textCapitalization: TextCapitalization.sentences,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textInputAction: TextInputAction.newline,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      autocorrect: true,
      controller: listController,
      style: R.textStyle.textSfProMedium(
          weight: FontWeight.w400,
          size: 14.sp,
          decoration: TextDecoration.none,
          color: R.colors.primarayTextColor),
      decoration: InputDecoration(
          hintText: 'new_list'.L(),
          hintStyle: R.textStyle.sfProDisplay(
              weight: FontWeight.w400,
              size: 16.sp,
              decoration: TextDecoration.none,
              color: R.colors.primarayTextColor.withOpacity(.4)),
          contentPadding: EdgeInsets.only(left: 2.w),
          border: InputBorder.none),
    );
  }

  Widget colorChoiceContainer(int index, ColorChoice colorChoice, Color color) {
    final isSelected = colorSelectChoice == colorChoice;
    return GestureDetector(
      onTap: () {
        setState(() {
          {
            handleColorChoice(colorChoice);
          }
        });
      },
      child: Container(
        height: 5.5.h,
        width: 12.w,
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: isSelected ? R.colors.darkGray : R.colors.white,
          ),
          shape: BoxShape.circle,
          color: color,
        ),
      ),
    );
  }

  Widget iconChoiceContainer(int index, IconChoice iconChoice, String image) {
    final isSelected = iconSelectChoice == iconChoice;
    return GestureDetector(
      onTap: () {
        setState(() {
          {
            handleIconChoice(iconChoice);
          }
        });
      },
      child: Container(
        height: 5.5.h,
        width: 12.w,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image),
            scale: 3.5,
          ),
          border: Border.all(
            width: 2,
            color: isSelected ? R.colors.darkGray : R.colors.white,
          ),
          borderRadius: BorderRadius.circular(50),
          color: R.colors.iconBgColor,
        ),
      ),
    );
  }

  Color colorFromChoice(ColorChoice? colorChoice) {
    switch (colorChoice) {
      case ColorChoice.forestGreen:
        return R.colors.forestGreen;
      case ColorChoice.royalPurple:
        return R.colors.royalPurple;
      case ColorChoice.yellow:
        return R.colors.yellow;
      case ColorChoice.gray:
        return R.colors.lightGray;
      case ColorChoice.scarletRed:
        return R.colors.scarletRed;
      case ColorChoice.caramel:
        return R.colors.caramel;
      case ColorChoice.skyBlue:
        return R.colors.skyBlue;
      case ColorChoice.sunsetOrange:
        return R.colors.sunsetOrange;
      case ColorChoice.teal:
        return R.colors.teal;
      case ColorChoice.pink:
        return R.colors.pink;
      case ColorChoice.purple:
        return R.colors.purple;
      case ColorChoice.brown:
        return R.colors.brown;
      case ColorChoice.none:
        return R.colors.white;
      case null:
        return R.colors.white;
    }
  }

  String iconFromChoice(IconChoice? iconChoice) {
    switch (iconChoice) {
      case IconChoice.document:
        return R.images.document;
      case IconChoice.basket:
        return R.images.basket;
      case IconChoice.edit:
        return R.images.sale;
      case IconChoice.gift:
        return R.images.gift;
      case IconChoice.heart:
        return R.images.heart;
      case IconChoice.bowtie:
        return R.images.bowtie;
      case IconChoice.car:
        return R.images.car;
      case IconChoice.constructs:
        return R.images.constructs;
      case IconChoice.rose:
        return R.images.rose;
      case IconChoice.glasses:
        return R.images.glass;
      case IconChoice.medKit:
        return R.images.medkit;
      case IconChoice.education:
        return R.images.education;
      case IconChoice.none:
        return '';
      case null:
        return '';
    }
  }
}
