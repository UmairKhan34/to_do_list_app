import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:groceryitems/resources/app_localization.dart';
import 'package:groceryitems/resources/resources.dart';
import 'package:groceryitems/src/base/view/list/model/list_model.dart';
import 'package:groceryitems/src/base/view/list/view/add_list_view.dart';
import 'package:groceryitems/src/base/view/list/view/add_product_view.dart';
import 'package:groceryitems/src/base/view/list/view/edit_list_view.dart';
import 'package:groceryitems/src/base/view/list/view_model/list_vm.dart';
import 'package:groceryitems/utilis/heights_widths.dart';
import 'package:groceryitems/utilis/toast_message/toast_message.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'package:gap/gap.dart';

class ProductListView extends StatefulWidget {
  static String route = "/productlist";
  const ProductListView({super.key});

  @override
  State<ProductListView> createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {
  ListModel? listModel;
  String? title;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      dynamic args = ModalRoute.of(context)?.settings.arguments;
      listModel = args['listModel'];

      if (listModel != null) {
        title = listModel!.title ?? "";
      }

      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ListVM>(
        builder: (context, listVm, child) => Scaffold(
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
                actions: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AddListView.route,
                          arguments: {"isEdit": false, "listModel": listModel});
                    },
                    child: Container(
                      height: 5.h,
                      width: 10.w,
                      decoration: BoxDecoration(
                          color: R.colors.editButtonColor,
                          borderRadius: BorderRadius.circular(50)),
                      child: Center(
                        child: Image.asset(
                          R.images.more,
                          color: R.colors.navigationColor,
                          scale: 3.5,
                        ),
                      ),
                    ),
                  ),
                  Gap(3.w)
                ],
              ),
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0.w),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          listModel?.title ?? "",
                          style: R.textStyle.sfProDisplay(
                              weight: FontWeight.bold,
                              size: 30.sp,
                              decoration: TextDecoration.none,
                              color: R.colors.primarayTextColor),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(AddProductListView.route);
                          },
                          child: Text(
                            'add_product'.L(),
                            style: R.textStyle.sfProDisplay(
                                weight: FontWeight.w400,
                                size: 14.sp,
                                decoration: TextDecoration.none,
                                color: R.colors.navigationColor),
                          ),
                        ),
                      ],
                    ),
                    h3,
                    listVm.showCatalogeList.isEmpty
                        ? Center(
                            child: Text(
                              'list_empty'.L(),
                              style: R.textStyle.textSfProBold(
                                  weight: FontWeight.w400,
                                  size: 15.sp,
                                  decoration: TextDecoration.none,
                                  color: R.colors.textFieldColor),
                            ),
                          )
                        : Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'shared_with'.L(),
                                    style: R.textStyle.textSfProRegular(
                                        weight: FontWeight.w400,
                                        size: 15.sp,
                                        decoration: TextDecoration.none,
                                        color: R.colors.primarayTextColor
                                            .withOpacity(.48)),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: 5.h,
                                        width: 12.w,
                                        decoration: BoxDecoration(
                                            color: R.colors.lightGray,
                                            shape: BoxShape.circle),
                                        child: Center(
                                          child: Icon(
                                            Icons.add,
                                            color: R.colors.white,
                                          ),
                                        ),
                                      ),
                                      Image.asset(
                                        R.images.profile,
                                        height: 5.h,
                                        width: 12.w,
                                      ),
                                      Image.asset(
                                        R.images.profile,
                                        height: 5.h,
                                        width: 12.w,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              const Divider()
                            ],
                          ),
                    h3,
                    Expanded(
                      child: SlidableAutoCloseBehavior(
                        child: ListView.builder(
                          itemCount: listVm.showCatalogeList.length,
                          itemBuilder: (context, index) {
                            bool isTitleUnique = listVm.showCatalogeList
                                .sublist(0, index)
                                .every((item) =>
                                    item.name !=
                                    listVm.showCatalogeList[index].name);

                            if (isTitleUnique) {
                              return showCatalogeList(
                                  listVm.showCatalogeList[index], listVm);
                            } else {
                              return const SizedBox();
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }

  Widget showCatalogeList(Cataloge model, ListVM listVm) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          model.name ?? "",
          style: R.textStyle.textSfProBold(
            weight: FontWeight.w500,
            size: 15.sp,
            decoration: TextDecoration.none,
            color: R.colors.teal,
          ),
        ),
        ...List.generate(model.catalogeItemList?.length ?? 0, (index) {
          var cartItem = model.catalogeItemList?[index] ??
              CatalogeItems(isSelected: false);

          return Slidable(
            endActionPane: ActionPane(
              dragDismissible: false,
              dismissible: DismissiblePane(onDismissed: () {}),
              motion: const ScrollMotion(),
              extentRatio: 0.74,
              children: [
                actionPaneContainer(
                  'copy'.L(),
                  R.images.copy,
                  R.colors.textFieldColor,
                  () {
                    Clipboard.setData(ClipboardData(text: cartItem.name ?? ""))
                        .then((value) {
                      ToastMessage.toastMessage(
                          'copied'.L(), R.colors.primarayTextColor);
                    });
                  },
                ),
                actionPaneContainer(
                  'edit'.L(),
                  R.images.edit,
                  R.colors.slidableBlue,
                  () {
                    Get.toNamed(EditListView.route,
                        arguments: {"catalogeList": cartItem});
                  },
                ),
                actionPaneContainer(
                  'delete'.L(),
                  R.images.remove,
                  R.colors.slidableRed,
                  () {
                    model.catalogeItemList![index].isSelected = false;
                    model.catalogeItemList!.removeAt(index);
                    if (model.catalogeItemList!.isEmpty) {
                      listVm.removeCataloge(model);
                    }
                    setState(() {});
                  },
                )
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                h3,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      cartItem.name ?? "",
                      style: R.textStyle.sfProDisplay(
                        weight: FontWeight.w400,
                        size: 15.sp,
                        decoration: TextDecoration.none,
                        color: R.colors.primarayTextColor,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '\$${(cartItem.price ?? 0.0).toStringAsFixed(2)}',
                          style: R.textStyle.sfProDisplay(
                            weight: FontWeight.w400,
                            size: 15.sp,
                            decoration: TextDecoration.none,
                            color: R.colors.gray,
                          ),
                        ),
                        w3,
                        Text(
                          ' ${cartItem.quantity ?? 0}',
                          style: R.textStyle.sfProDisplay(
                            weight: FontWeight.w400,
                            size: 15.sp,
                            decoration: TextDecoration.none,
                            color: R.colors.primarayTextColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Divider(
                  thickness: .5,
                )
              ],
            ),
          );
        }),
      ],
    );
  }

  Widget actionPaneContainer(
      String text, String image, Color color, VoidCallback onTap,
      {int? modelIndex}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 10.2.h,
        width: 22.w,
        decoration: BoxDecoration(color: color),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              scale: 3.5,
            ),
            Text(
              text,
              style: R.textStyle.textSfProRegular(
                  weight: FontWeight.w400,
                  size: 11.sp,
                  decoration: TextDecoration.none,
                  color: R.colors.white),
            )
          ],
        ),
      ),
    );
  }
}
