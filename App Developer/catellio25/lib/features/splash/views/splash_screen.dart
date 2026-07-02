import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../../../utils/app_strings/app_strings.dart';
import '../../../utils/app_icons/app_icons.dart';
import '../../../global_widgets/custom_image/custom_image.dart';
import '../view_models/splash_view_model.dart';
import '../../../global_widgets/custom_text/custom_text.dart';

class SplashScreen extends GetView<SplashViewModel> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            // Center Logo
            CustomImage(
              imageSrc: AppIcons.splashIcon,
              height: 180.h,
              width: 180.h,
              boxFit: BoxFit.contain,
            ),
            SizedBox(height: 30.h),
            CustomText(
              text: AppStrings.alfred,
              fontSize: 32.sp,
              fontWeight: FontWeight.w900,
              color: AppColors.black,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10.h),
            CustomText(
              text: AppStrings.yourPersonalDateConcierge,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.greyShade,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 8.h,
                  width: 8.h,
                  decoration: const BoxDecoration(
                    color: AppColors.black,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: 8.w),
                CustomText(
                  text: AppStrings.initializingSecureConcierge,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.greyShade,
                ),
              ],
            ),
            SizedBox(height: 60.h),
          ],
        ),
      ),
    );
  }
}

