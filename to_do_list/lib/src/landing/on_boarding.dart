import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groceryitems/resources/app_localization.dart';
import 'package:groceryitems/resources/resources.dart';
import 'package:groceryitems/src/auth/view/login_screen_view.dart';
import 'package:groceryitems/src/auth/view/sign_up_screen_view.dart';
import 'package:groceryitems/src/landing/walk_through_screen.dart';
import 'package:groceryitems/utilis/on_boarding_button.dart';

import 'package:sizer/sizer.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  static String route = "/onboarding";
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController controller = PageController();
  bool onlastpage = false;
  int currentindex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() {
              onlastpage = (index == 1);
            });
            index++;
            currentindex = index;
          },
          children: [
            WalkThroughScreen(currentindex: currentindex),
            WalkThroughScreen(currentindex: currentindex),
            WalkThroughScreen(currentindex: currentindex)
          ],
        ),
        Container(
            alignment: const Alignment(0, 0.75),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                padding: EdgeInsets.only(top: 78.h),
                child: SmoothPageIndicator(
                  controller: controller,
                  count: 3,
                  effect: SlideEffect(
                    activeDotColor: R.colors.white,
                    dotHeight: 10,
                    dotColor: R.colors.white.withOpacity(.3),
                    dotWidth: 10,
                  ),
                ),
              ),
              onlastpage
                  ? Column(
                      children: [
                        SizedBox(
                          height: 3.h,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 7.w,
                            ),
                            OnBoardingButton(
                                width: 40.w,
                                height: 7.h,
                                title: LocalizationMap.getValues('sign_in'),
                                onpress: () {
                                  Get.offAllNamed(LoginScreenView.route);
                                }),
                            SizedBox(
                              width: 8.w,
                            ),
                            OnBoardingButton(
                                width: 40.w,
                                height: 7.h,
                                title: LocalizationMap.getValues('sign_up'),
                                onpress: () {
                                  Get.offAllNamed(SignUpScreenView.route);
                                }),
                          ],
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        SizedBox(
                          height: 3.h,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 7.w,
                            ),
                            OnBoardingButton(
                                width: 40.w,
                                height: 7.h,
                                title: LocalizationMap.getValues('sign_in'),
                                onpress: () {
                                  Get.offAllNamed(LoginScreenView.route);
                                }),
                            SizedBox(
                              width: 8.w,
                            ),
                            OnBoardingButton(
                                width: 40.w,
                                height: 7.h,
                                title: LocalizationMap.getValues('sign_up'),
                                onpress: () {
                                  Get.offAllNamed(SignUpScreenView.route);
                                }),
                          ],
                        ),
                      ],
                    )
            ]))
      ]),
    );
  }
}
