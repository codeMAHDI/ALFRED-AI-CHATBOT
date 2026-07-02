import 'package:catellio25/utils/helper/device_utils/device_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'core/app_routes/app_routes.dart';
import 'core/theme/app_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DeviceUtils.lockDevicePortrait();


  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(428, 926),
      child: GetMaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.background,
          appBarTheme: AppBarTheme(
            toolbarHeight: 65,
            elevation: 0,
            centerTitle: true,
            backgroundColor: AppColors.background,
            iconTheme: IconThemeData(
              color: AppColors.primary,
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 200),
        initialRoute: AppRoutes.splashScreen,
        getPages: AppRoutes.routes,
      ),
    );
  }
}
