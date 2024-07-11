import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
//import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:groceryitems/constants/enum.dart';
import 'package:groceryitems/resources/app_localization.dart';
import 'package:groceryitems/resources/resources.dart';
import 'package:groceryitems/src/base/view/list/view_model/list_vm.dart';
import 'package:groceryitems/src/base/view/trash/model/trash_model.dart';
import 'package:groceryitems/src/base/view/trash/view_model/trash_vm.dart';
import 'package:groceryitems/utilis/heights_widths.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class TrashScreenView extends StatefulWidget {
  const TrashScreenView({super.key});

  @override
  State<TrashScreenView> createState() => _TrashScreenViewState();
}

class _TrashScreenViewState extends State<TrashScreenView> {
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

  TrashModel trash = TrashModel();
  @override
  Widget build(BuildContext context) {
    return Consumer2<TrashVM, ListVM>(
      builder: (context, trashVm, listVm, child) => Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            h7P5,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0.w),
              child: Text(
                'trash'.L(),
                style: R.textStyle.sfProDisplay(
                  weight: FontWeight.bold,
                  size: 30.sp,
                  decoration: TextDecoration.none,
                  color: R.colors.primarayTextColor,
                ),
              ),
            ),
            Expanded(
              child: trashVm.trashList.isEmpty
                  ? Center(
                      child: Text(
                        'no_list'.L(),
                        style: R.textStyle.textSfProRegular(
                          weight: FontWeight.w400,
                          size: 14.sp,
                          decoration: TextDecoration.none,
                          color: R.colors.textFieldColor,
                        ),
                      ),
                    )
                  : SlidableAutoCloseBehavior(
                      child: ListView.builder(
                        itemCount: trashVm.trashList.length,
                        itemBuilder: (context, index) {
                          trash = trashVm.trashList[index];
                          return Slidable(
                            closeOnScroll: false,
                            endActionPane: ActionPane(
                                dragDismissible: false,
                                dismissible:
                                    DismissiblePane(onDismissed: () {}),
                                motion: const ScrollMotion(),
                                extentRatio: 0.5,
                                children: [
                                  actionPaneContainer(
                                      'restore'.L(),
                                      R.images.restore,
                                      R.colors.slidableGreen, () {
                                    trashVm.restoreFromTrash(index, listVm);
                                  }),
                                  w2,
                                  actionPaneContainer(
                                      'delete'.L(),
                                      R.images.remove,
                                      R.colors.slidableRed, () {
                                    trashVm.trashList.removeAt(index);
                                    trashVm.update();
                                  })
                                ]),
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: 3.w,
                                vertical: 1.h,
                              ),
                              height: 10.h,
                              decoration: BoxDecoration(
                                color: R.colors.gray.withOpacity(.06),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: [
                                  w3,
                                  Container(
                                    height: 5.5.h,
                                    width: 12.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: colorFromChoice(trash.color),
                                    ),
                                    child: Image.asset(
                                      iconFromChoice(trash.icon),
                                      color: Colors.white,
                                      scale: 3.5,
                                    ),
                                  ),
                                  w3,
                                  Text(
                                    trashVm.trashList[index].title ?? "",
                                    style: R.textStyle.textSfProBold(
                                      weight: FontWeight.w400,
                                      size: 14.sp,
                                      decoration: TextDecoration.none,
                                      color: R.colors.primarayTextColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget actionPaneContainer(
      String text, String image, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 10.2.h,
        width: 22.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: color),
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
