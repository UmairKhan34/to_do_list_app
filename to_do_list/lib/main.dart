import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groceryitems/routes/routes_view.dart';
import 'package:groceryitems/src/auth/view_model/auth_vm.dart';
import 'package:groceryitems/src/base/view/list/view_model/list_vm.dart';
import 'package:groceryitems/src/base/view/profile/view_model/profile_vm.dart';
import 'package:groceryitems/src/base/view/trash/view_model/trash_vm.dart';
import 'package:groceryitems/src/landing/on_boarding.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(
    DevicePreview(
        enabled: !kReleaseMode,
        builder: (context)=>MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthVM()),
        ChangeNotifierProvider(create: (_) => ProfileVM()),
        ChangeNotifierProvider(create: (_) => ListVM()),
        ChangeNotifierProvider(create: (_) => TrashVM()),
      ],
      child: const MyApp(),
    ))
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const OnBoardingScreen(),
        initialRoute: OnBoardingScreen.route,
        getPages: AppRoutes.pages,
      );
    });
  }
}
