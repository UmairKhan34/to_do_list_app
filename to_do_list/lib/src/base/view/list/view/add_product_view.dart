import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:groceryitems/resources/app_localization.dart';
import 'package:groceryitems/resources/resources.dart';
import 'package:groceryitems/src/base/view/list/model/list_model.dart';
import 'package:groceryitems/src/base/view/list/view/catalog_items_view.dart';
import 'package:groceryitems/src/base/view/list/view_model/list_vm.dart';
import 'package:groceryitems/utilis/heights_widths.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class AddProductListView extends StatefulWidget {
  static String route = "/addproduct";
  const AddProductListView({super.key});

  @override
  State<AddProductListView> createState() => _AddProductListViewState();
}

class _AddProductListViewState extends State<AddProductListView> {
  int selectedIndex = 1;
  TextEditingController addProductController = TextEditingController();
  TextEditingController addCatalogController = TextEditingController();

  String search = "";
  @override
  void dispose() {
    addProductController.dispose();
    addCatalogController.dispose();
    super.dispose();
  }

  late ListVM listVm;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      listVm = Provider.of<ListVM>(context, listen: false);

      for (var catalogeModel in listVm.popularModel) {
        for (var cartItem in catalogeModel.catalogeItemList ?? []) {
          if (listVm.showCatalogeList.any((element) =>
              element.catalogeItemList?.contains(cartItem) ?? false)) {
            cartItem.isSelected = true;
          } else {
            cartItem.isSelected = false;
          }
        }
        listVm.update();
      }
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
              ),
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Column(
                  children: [
                    Gap(3.h),
                    productTextFormField(),
                    Gap(3.h),
                    selectRow(),
                    selectedIndex == 1
                        ? Expanded(
                            child: ListView.builder(
                                itemCount: listVm.popularModel
                                    .where((element) =>
                                        element.catalogeItemList
                                            ?.any((e) => e.isPopular == true) ??
                                        false)
                                    .toList()
                                    .length,
                                itemBuilder: (context, index) {
                                  return popularListView(
                                      listVm.popularModel
                                          .where((element) =>
                                              element.catalogeItemList?.any(
                                                  (e) => e.isPopular == true) ??
                                              false)
                                          .toList()[index],
                                      listVm);
                                }),
                          )
                        : Expanded(
                            child: ListView.builder(
                                itemCount: listVm.popularModel.length,
                                itemBuilder: (context, index) {
                                  return catalogListView(listVm, index);
                                }),
                          )
                  ],
                ),
              ),
            ));
  }

  Widget productTextFormField() {
    return TextFormField(
      onChanged: (String? value) {
        setState(() {
          search = value.toString();
        });
      },
      controller:
          selectedIndex == 1 ? addProductController : addCatalogController,
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
          fillcolor: R.colors.lightGray,
          borderColor: R.colors.lightGray,
          filled: true),
    );
  }

  Widget selectRow() {
    return Container(
      decoration: BoxDecoration(color: R.colors.white),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = 1;
                });
              },
              child: Container(
                height: 4.h,
                width: 45.w,
                decoration: BoxDecoration(
                    color: selectedIndex == 1
                        ? R.colors.navigationColor
                        : R.colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                    border: Border.all(color: R.colors.navigationColor)),
                child: Center(
                  child: Text(
                    'popular'.L(),
                    style: R.textStyle.textSfProBold(
                        weight: FontWeight.w400,
                        size: 11.sp,
                        decoration: TextDecoration.none,
                        color: selectedIndex == 1
                            ? R.colors.white
                            : R.colors.navigationColor),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
              child: GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = 2;
              });
            },
            child: Container(
              height: 4.h,
              width: 45.w,
              decoration: BoxDecoration(
                  color: selectedIndex == 2
                      ? R.colors.navigationColor
                      : R.colors.white,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  border: Border.all(color: R.colors.navigationColor)),
              child: Center(
                child: Text(
                  'catalogs'.L(),
                  style: R.textStyle.textSfProBold(
                      weight: FontWeight.w400,
                      size: 11.sp,
                      decoration: TextDecoration.none,
                      color: selectedIndex == 2
                          ? R.colors.white
                          : R.colors.navigationColor),
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }

  Widget popularListView(Cataloge model, ListVM listVm) {
    if (addProductController.text.isEmpty) {
      return Column(
        children: [
          ...List.generate(
              model.catalogeItemList
                      ?.where((element) => element.isPopular ?? false)
                      .length ??
                  0, (index) {
            var cartItem = model.catalogeItemList
                ?.where((element) => element.isPopular ?? false)
                .toList()[index];
            return searchList(
              cartItem,
              model,
              listVm,
            );
          }),
        ],
      );
    } else {
      final filteredList = model.catalogeItemList
          ?.where((element) =>
              (element.isPopular ?? false) &&
              (element.name
                      ?.toLowerCase()
                      .contains(addProductController.text.toLowerCase()) ??
                  false))
          .toList();

      if (filteredList != null && filteredList.isNotEmpty) {
        return Column(
          children: [
            ...List.generate(filteredList.length, (index) {
              var cartItem = filteredList[index];
              return searchList(
                cartItem,
                model,
                listVm,
              );
            }),
          ],
        );
      } else {
        return const SizedBox();
      }
    }
  }

  Widget searchList(
    CatalogeItems? cartItem,
    Cataloge model,
    ListVM listVm,
  ) {
    return Row(
      children: [
        Container(
          height: 7.h,
          width: 90.w,
          decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(color: R.colors.iconColor, width: 1.0)),
            color: R.colors.white,
          ),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  if (cartItem != null) {
                    cartItem.isSelected = !(cartItem.isSelected ?? false);
                    listVm.addCatalogeList(
                        model.name ?? "", cartItem.name ?? "");
                    listVm.update();
                    setState(() {});
                  }
                },
                child: Container(
                  width: 10.w,
                  height: 3.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (cartItem?.isSelected ?? false)
                        ? R.colors.navigationColor
                        : R.colors.white,
                    border: Border.all(color: R.colors.navigationColor),
                  ),
                  child: Center(
                    child: Icon(
                      (cartItem?.isSelected ?? false) ? Icons.add : Icons.add,
                      color: (cartItem?.isSelected ?? false)
                          ? R.colors.white
                          : R.colors.navigationColor,
                    ),
                  ),
                ),
              ),
              Text(
                cartItem?.name ?? "",
                style: R.textStyle.textSfProRegular(
                  weight: FontWeight.w400,
                  size: 13.sp,
                  decoration: TextDecoration.none,
                  color: R.colors.primarayTextColor,
                ),
              ),
              w1,
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      fit: FlexFit.loose,
                      child: Text(
                        softWrap: false,
                        overflow: TextOverflow.fade,
                        "in ${model.name ?? ""}",
                        style: R.textStyle.textSfProRegular(
                          weight: FontWeight.w400,
                          size: 11.sp,
                          decoration: TextDecoration.none,
                          color: R.colors.primarayTextColor.withOpacity(.3),
                        ),
                      ),
                    ),
                    (cartItem?.isSelected ?? false)
                        ? TextButton(
                            onPressed: () {
                              cartItem?.isSelected =
                                  !(cartItem.isSelected ?? false);
                              listVm.showCatalogeList.removeWhere(
                                  (item) => item.id == cartItem?.id);
                              listVm.update();
                              setState(() {});
                            },
                            child: Text(
                              'remove'.L(),
                              style: R.textStyle.textSfProBold(
                                  weight: FontWeight.w400,
                                  size: 14.sp,
                                  decoration: TextDecoration.none,
                                  color: R.colors.slidableRed),
                            ))
                        : Container(),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget catalogListView(ListVM listVm, int index) {
    late String addCatalog = listVm.popularModel[index].name ?? "";
    if (addCatalogController.text.isEmpty) {
      return Column(
        children: [
          ListTile(
            onTap: () {
              Get.toNamed(CatalogeItemsListView.route,
                  arguments: {"catalogeModel": listVm.popularModel[index]});
            },
            contentPadding:
                EdgeInsets.symmetric(horizontal: 0.w, vertical: 0.h),
            titleTextStyle: R.textStyle.textSfProBold(
                weight: FontWeight.w400,
                size: 14.sp,
                decoration: TextDecoration.none,
                color: R.colors.primarayTextColor),
            leading: Container(
              height: 4.h,
              width: 14.w,
              decoration: BoxDecoration(
                  color: R.colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: R.colors.gray)),
              child: Center(
                child: Image.asset(
                  listVm.popularModel[index].image ?? "",
                  scale: 4,
                ),
              ),
            ),
            title: Text(listVm.popularModel[index].name ?? ""),
            trailing: Image.asset(
              R.images.forward,
              scale: 4,
            ),
          ),
          const Divider(
            thickness: 0.5,
          )
        ],
      );
    } else if (addCatalog.toLowerCase().contains(addCatalogController.text) ||
        addCatalog.toUpperCase().contains(addCatalogController.text)) {
      return Column(
        children: [
          ListTile(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 0.w, vertical: 0.h),
            titleTextStyle: R.textStyle.textSfProBold(
                weight: FontWeight.w400,
                size: 14.sp,
                decoration: TextDecoration.none,
                color: R.colors.primarayTextColor),
            leading: Container(
              height: 4.h,
              width: 14.w,
              decoration: BoxDecoration(
                color: R.colors.white,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Image.asset(
                  listVm.popularModel[index].image ?? "",
                  scale: 4,
                ),
              ),
            ),
            title: Text(listVm.popularModel[index].name ?? ""),
            trailing: Image.asset(
              R.images.forward,
              scale: 4,
            ),
          ),
          const Divider(
            thickness: 0.5,
          )
        ],
      );
    } else {
      return const SizedBox();
    }
  }
}
