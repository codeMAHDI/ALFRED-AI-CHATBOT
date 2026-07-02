import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../../utils/app_images/app_images.dart';
import '../../../../global_widgets/custom_text/custom_text.dart';
import '../../../../global_widgets/animated_sparking_orb/animated_sparking_orb.dart';
import '../view_models/finding_date_splash_view_model.dart';

class FindingDateSplashView extends GetView<FindingDateSplashViewModel> {
  const FindingDateSplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Center(
              child: AnimatedSparkingOrb(
                imagePath: AppImages.orbImage,
                width: 260.w,
                height: 260.w,
              ),
            ),
            SizedBox(height: 40.h),
            CustomText(
              text: AppStrings.findingDate,
              fontSize: 18.sp,
              color: AppColors.black,
            ),
            SizedBox(height: 24.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildDot(),
                SizedBox(width: 8.w),
                _buildDot(),
                SizedBox(width: 8.w),
                _buildDot(),
              ],
            ),
            const Spacer(),
            CustomText(
              text: AppStrings.secureAiEngine,
              fontSize: 10.sp,
              color: AppColors.greyShade.withOpacity(0.5),
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }

  Widget _buildDot() {
    return Container(
      width: 6.w,
      height: 6.w,
      decoration: BoxDecoration(
        color: AppColors.greyShade.withOpacity(0.4),
        shape: BoxShape.circle,
      ),
    );
  }
}
