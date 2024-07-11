import 'package:flutter/material.dart';
import 'package:groceryitems/resources/app_localization.dart';
import 'package:groceryitems/resources/resources.dart';
import 'package:groceryitems/src/base/view/list/view/list_view_screen.dart';
import 'package:groceryitems/src/base/view/profile/view/profile_setting_view.dart';
import 'package:groceryitems/src/base/view/trash/view/trash_screen_view.dart';
import 'package:sizer/sizer.dart';

class BaseView extends StatefulWidget {
  static String route = "/bottomnavigation";
  const BaseView({super.key});

  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  int _selectedIndex = 0;
  List<Widget> widgetList = [
    const ListViewScreen(),
    const TrashScreenView(),
    const ProfileSettingView()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: widgetList[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: R.colors.navigationColor,
        selectedLabelStyle: R.textStyle.textSfProRegular(
            weight: FontWeight.w400,
            size: 8.sp,
            decoration: TextDecoration.none,
            color: R.colors.gray),
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          commonBottomNavigation(R.images.list, R.images.list, 'list'),
          commonBottomNavigation(R.images.delete, R.images.delete, 'delete'),
          commonBottomNavigation(
              R.images.settings, R.images.settings, 'settings')
        ],
      ),
    );
  }

  BottomNavigationBarItem commonBottomNavigation(
      String image, String iconImage, String text) {
    return BottomNavigationBarItem(
      activeIcon: Image.asset(
        image,
        scale: 3.5,
        color: R.colors.navigationColor,
      ),
      icon: Image.asset(
        iconImage,
        scale: 3.5,
      ),
      backgroundColor: R.colors.bottomNavigation,
      label: LocalizationMap.getValues(text),
    );
  }
}
