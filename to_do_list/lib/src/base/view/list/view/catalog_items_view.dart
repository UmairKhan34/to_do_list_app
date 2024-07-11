// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:groceryitems/resources/app_localization.dart';
import 'package:groceryitems/resources/resources.dart';
import 'package:groceryitems/src/base/view/list/model/list_model.dart';
import 'package:groceryitems/utilis/heights_widths.dart';
import 'package:sizer/sizer.dart';

class CatalogeItemsListView extends StatefulWidget {
  static const String route = "/catalogeListItems";
  final Cataloge? selectedCataloge;

  const CatalogeItemsListView({Key? key, this.selectedCataloge})
      : super(key: key);

  @override
  State<CatalogeItemsListView> createState() => _CatalogeItemsListViewState();
}

class _CatalogeItemsListViewState extends State<CatalogeItemsListView> {
  Cataloge? cataloge;
  String? title;
  String? image;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      dynamic args = ModalRoute.of(context)?.settings.arguments;
      cataloge = args['catalogeModel'];

      if (cataloge != null) {
        title = cataloge!.name ?? "";
        image = cataloge!.image.toString();
      }

      setState(() {
        print("catalogeModel:${cataloge?.name}");
      });
    });
    super.initState();
  }

  String search = "";
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: R.colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: R.colors.white,
          title: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Row(
              children: [
                Image.asset(
                  R.images.backward,
                  scale: 3.5,
                ),
                w3,
                Text(
                  'back'.L(),
                  style: R.textStyle.textSfProBold(
                      weight: FontWeight.w400,
                      size: 14.sp,
                      decoration: TextDecoration.none,
                      color: R.colors.navigationColor),
                )
              ],
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0.w),
          child: Column(
            children: [
              Gap(3.h),
              catalogTextFormField(),
              Gap(2.h),
              Container(
                height: 7.h,
                width: 90.w,
                decoration: BoxDecoration(
                    color: R.colors.gray.withOpacity(.04),
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: [
                    Gap(3.w),
                    Container(
                      height: 4.h,
                      width: 10.w,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: R.colors.white,
                          border:
                              Border.all(color: R.colors.primarayTextColor)),
                      child: Image.asset(
                        image.toString(),
                        scale: 3.5,
                      ),
                    ),
                    Gap(2.w),
                    Text(
                      title ?? "",
                      style: R.textStyle.sfProDisplay(
                          weight: FontWeight.w500,
                          size: 13.sp,
                          decoration: TextDecoration.none,
                          color: R.colors.primarayTextColor),
                    )
                  ],
                ),
              ),
              Gap(1.h),
              Expanded(
                child: ListView.builder(
                  itemCount: cataloge?.catalogeItemList?.length ?? 0,
                  itemBuilder: (context, index) {
                    final catalogItem = cataloge!.catalogeItemList![index];
                    late String name = catalogItem.name ?? "";
                    if (searchController.text.isEmpty) {
                      return Column(
                        children: [
                          ListTile(
                            leading: Container(
                              width: 10.w,
                              height: 3.h,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: R.colors.white,
                                  border: Border.all(
                                      color: R.colors.navigationColor)),
                              child: Center(
                                child: Icon(
                                  Icons.add,
                                  color: R.colors.navigationColor,
                                ),
                              ),
                            ),
                            title: Text(
                              catalogItem.name ?? "",
                              style: R.textStyle.textSfProBold(
                                  weight: FontWeight.w400,
                                  size: 14.sp,
                                  decoration: TextDecoration.none,
                                  color: R.colors.primarayTextColor),
                            ),
                          ),
                          const Divider()
                        ],
                      );
                    } else if (name
                            .toLowerCase()
                            .contains(searchController.text) ||
                        name.toUpperCase().contains(searchController.text)) {
                      return Column(
                        children: [
                          ListTile(
                            leading: Container(
                              width: 10.w,
                              height: 3.h,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: R.colors.white,
                                  border: Border.all(
                                      color: R.colors.navigationColor)),
                              child: Center(
                                child: Icon(
                                  Icons.add,
                                  color: R.colors.navigationColor,
                                ),
                              ),
                            ),
                            title: Text(
                              catalogItem.name ?? "",
                              style: R.textStyle.textSfProBold(
                                  weight: FontWeight.w400,
                                  size: 14.sp,
                                  decoration: TextDecoration.none,
                                  color: R.colors.primarayTextColor),
                            ),
                          ),
                          const Divider()
                        ],
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
            ],
          ),
        ));
  }

  Widget catalogTextFormField() {
    return TextFormField(
      onChanged: (String? value) {
        setState(() {
          search = value.toString();
        });
      },
      controller: searchController,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      autocorrect: true,
      decoration: R.fieldDecoration.decoration(
          prefixIcon: Icon(
            Icons.search,
            color: R.colors.gray,
          ),
          suffixIcon: Icon(
            Icons.mic,
            color: R.colors.gray,
          ),
          hint: 'add_product'.L(),
          textStyle: R.textStyle.textSfProMedium(
              weight: FontWeight.w400,
              size: 14.sp,
              decoration: TextDecoration.none,
              color: R.colors.gray),
          radius: 10,
          fillcolor: R.colors.sageGray.withOpacity(.2),
          borderColor: R.colors.lightGray,
          filled: true),
    );
  }
}
