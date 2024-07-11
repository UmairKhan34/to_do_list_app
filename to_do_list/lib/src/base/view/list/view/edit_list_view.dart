import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groceryitems/resources/app_localization.dart';
import 'package:groceryitems/resources/resources.dart';
import 'package:groceryitems/src/base/view/list/model/list_model.dart';
import 'package:groceryitems/src/base/view/list/view_model/list_vm.dart';
import 'package:groceryitems/utilis/heights_widths.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class EditListView extends StatefulWidget {
  static String route = "/editlist";
  const EditListView({super.key});

  @override
  State<EditListView> createState() => _EditListViewState();
}

class _EditListViewState extends State<EditListView> {
  var title = Get.arguments;
  TextEditingController listController = TextEditingController();
  int quantity = 0;
  double price = 0.0;
  CatalogeItems? catalogeItems;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      dynamic args = ModalRoute.of(context)?.settings.arguments;
      if (args != null) {
        catalogeItems = args['catalogeList'];
        if (catalogeItems != null) {
          listController.text = catalogeItems?.name ?? "";
        }
      }
      setState(() {});
    });
    super.initState();
  }

  void increaseQuantity() {
    setState(() {
      quantity++;
      price += 10.0;
    });
  }

  void decreaseQuantity() {
    if (quantity > 0) {
      setState(() {
        quantity--;
        price -= 10.0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ListVM>(
        builder: (context, listVm, child) => Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: R.colors.navigationColor,
                title: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Text(
                    'cancel'.L(),
                    style: R.textStyle.textSfProMedium(
                      weight: FontWeight.w400,
                      size: 15.sp,
                      decoration: TextDecoration.none,
                      color: R.colors.white,
                    ),
                  ),
                ),
                actions: [
                  GestureDetector(
                    onTap: () {
                      catalogeItems?.name = listController.text;
                      catalogeItems?.quantity = quantity;
                      catalogeItems?.price = price;
                      listVm.update();
                      Get.back();
                    },
                    child: Text(
                      'done'.L(),
                      style: R.textStyle.textSfProMedium(
                        weight: FontWeight.w400,
                        size: 15.sp,
                        decoration: TextDecoration.none,
                        color: R.colors.white,
                      ),
                    ),
                  ),
                  w3,
                ],
              ),
              body: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 14.h,
                    decoration: BoxDecoration(color: R.colors.navigationColor),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'item_name'.L(),
                            style: R.textStyle.sfProDisplay(
                              weight: FontWeight.w400,
                              size: 13.sp,
                              decoration: TextDecoration.none,
                              color: R.colors.white.withOpacity(.6),
                            ),
                          ),
                          itemTextFormField(),
                          Divider(
                            color: R.colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                  h3,
                  Padding(
                    padding: EdgeInsets.only(left: 3.0.w),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            w5,
                            Text(
                              'qty'.L(),
                              style: R.textStyle.textSfProMedium(
                                  weight: FontWeight.w400,
                                  size: 15.sp,
                                  decoration: TextDecoration.none,
                                  color: R.colors.primarayTextColor
                                      .withOpacity(.4)),
                            ),
                            w10,
                            Text(
                              quantity.toString(),
                              style: R.textStyle.textSfProMedium(
                                weight: FontWeight.w400,
                                size: 15.sp,
                                decoration: TextDecoration.none,
                                color: R.colors.primarayTextColor,
                              ),
                            ),
                            w40,
                            GestureDetector(
                              onTap: decreaseQuantity,
                              child: Container(
                                height: 4.h,
                                width: 10.w,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        topLeft: Radius.circular(10)),
                                    border: Border.all(
                                        color: R.colors.navigationColor)),
                                child: Center(
                                  child: Icon(
                                    Icons.remove,
                                    color: R.colors.navigationColor,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: increaseQuantity,
                              child: Container(
                                height: 4.h,
                                width: 10.w,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                        bottomRight: Radius.circular(10),
                                        topRight: Radius.circular(10)),
                                    border: Border.all(
                                        color: R.colors.navigationColor)),
                                child: Center(
                                  child: Icon(
                                    Icons.add,
                                    color: R.colors.navigationColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Divider(),
                        h3,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            w5,
                            Text(
                              'price'.L(),
                              style: R.textStyle.textSfProMedium(
                                  weight: FontWeight.w400,
                                  size: 15.sp,
                                  decoration: TextDecoration.none,
                                  color: R.colors.primarayTextColor
                                      .withOpacity(.4)),
                            ),
                            w5,
                            Text(
                              '$price',
                              style: R.textStyle.textSfProMedium(
                                weight: FontWeight.w400,
                                size: 15.sp,
                                decoration: TextDecoration.none,
                                color: R.colors.primarayTextColor,
                              ),
                            ),
                            w40,
                          ],
                        ),
                        const Divider(),
                      ],
                    ),
                  )
                ],
              ),
            ));
  }

  Widget itemTextFormField() {
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
        size: 24.sp,
        decoration: TextDecoration.none,
        color: R.colors.white,
      ),
      decoration: InputDecoration(
        hintText: 'new_list'.L(),
        hintStyle: R.textStyle.sfProDisplay(
          weight: FontWeight.w400,
          size: 16.sp,
          decoration: TextDecoration.none,
          color: R.colors.primarayTextColor.withOpacity(.4),
        ),
        contentPadding: EdgeInsets.only(left: 2.w),
        border: InputBorder.none,
      ),
    );
  }
}
