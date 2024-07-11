// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:groceryitems/resources/app_localization.dart';
import 'package:groceryitems/resources/resources.dart';
import 'package:sizer/sizer.dart';

class WalkThroughScreen extends StatefulWidget {
  int currentindex = 0;
  WalkThroughScreen({super.key, required this.currentindex});

  @override
  State<WalkThroughScreen> createState() => _WalkThroughScreenState();
}

class _WalkThroughScreenState extends State<WalkThroughScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            color: R.colors.primarayTextColor,
            image: DecorationImage(
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                R.colors.gray.withOpacity(1),
                BlendMode.modulate,
              ),
              image: AssetImage(
                R.images.onboarding,
              ),
            )),
        child: Column(
          children: [
            SizedBox(
              height: 11.h,
            ),
            Text(
              LocalizationMap.getValues('welcome_to_shopifylist'),
              style: R.textStyle.textSfProBold(
                  weight: FontWeight.w500,
                  size: 15.sp,
                  decoration: TextDecoration.none,
                  color: R.colors.white),
            ),
            SizedBox(
              height: 1.5.h,
            ),
            Text(
              LocalizationMap.getValues(
                  'the_right_way_to_make_your_shopping_easier'),
              style: R.textStyle.textSfProRegular(
                  weight: FontWeight.w500,
                  size: 12.sp,
                  decoration: TextDecoration.none,
                  color: R.colors.white.withOpacity(.7)),
            ),
            SizedBox(
              height: 42.5.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  LocalizationMap.getValues('benefits'),
                  style: R.textStyle.textSfProRegular(
                      weight: FontWeight.w500,
                      size: 12.sp,
                      decoration: TextDecoration.none,
                      color: R.colors.white.withOpacity(.6)),
                ),
                SizedBox(
                  width: 2.w,
                ),
                Text(
                  widget.currentindex.toString(),
                  style: R.textStyle.textSfProRegular(
                      weight: FontWeight.w500,
                      size: 12.sp,
                      decoration: TextDecoration.none,
                      color: R.colors.white.withOpacity(.6)),
                ),
                Text(
                  '/3',
                  style: R.textStyle.textSfProRegular(
                      weight: FontWeight.w500,
                      size: 12.sp,
                      decoration: TextDecoration.none,
                      color: R.colors.white.withOpacity(.6)),
                ),
              ],
            ),
            SizedBox(
              height: 1.5.h,
            ),
            Text(
              LocalizationMap.getValues('save_your_time_&_energy'),
              style: R.textStyle.sfProDisplay(
                  weight: FontWeight.w500,
                  size: 20.sp,
                  decoration: TextDecoration.none,
                  color: R.colors.white),
            ),
            SizedBox(
              height: 1.5.h,
            ),
            Text(
              LocalizationMap.getValues('make_shopping_smarter_avoid_extra'),
              style: R.textStyle.textSfProRegular(
                  weight: FontWeight.w500,
                  size: 14.sp,
                  decoration: TextDecoration.none,
                  color: R.colors.white.withOpacity(.8)),
            ),
            Text(
              LocalizationMap.getValues(
                  'trips_to_the_supermarkets_&_malls_and'),
              style: R.textStyle.textSfProRegular(
                  weight: FontWeight.w500,
                  size: 14.sp,
                  decoration: TextDecoration.none,
                  color: R.colors.white.withOpacity(.8)),
            ),
            Text(
              LocalizationMap.getValues(
                  'get_more_organized_using_shopifylist.'),
              style: R.textStyle.textSfProRegular(
                  weight: FontWeight.w500,
                  size: 14.sp,
                  decoration: TextDecoration.none,
                  color: R.colors.white.withOpacity(.8)),
            ),
          ],
        ));
  }
}
