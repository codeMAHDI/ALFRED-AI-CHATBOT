import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../../global_widgets/custom_button/custom_button.dart';
import '../../../../global_widgets/custom_text/custom_text.dart';
import '../view_models/onboarding_view_model.dart';

class OnboardingBottomSection extends GetView<OnboardingViewModel> {
  const OnboardingBottomSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      child: Obx(() {
        int index = controller.currentPage.value;
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                controller.pages.length,
                (i) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: 4.w),
                  height: 8.h,
                  width: 8.w,
                  decoration: BoxDecoration(
                    color: index == i ? AppColors.black : AppColors.dotLight,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            SizedBox(height: 32.h),
            // Custom Button
            CustomButton(
              onTap: controller.nextPage,
              title: index == controller.pages.length - 1
                  ? "${AppStrings.continueTxt} \u2192" // Adds an arrow textually for the last screen
                  : AppStrings.continueTxt,
            ),
            SizedBox(height: 24.h),
            // Bottom Text Action
            GestureDetector(
              onTap: () {
                if (index == 0) {
                  controller.navigateToLogin();
                } else {
                  controller.previousPage();
                }
              },
              child: CustomText(
                text: index == 0 ? AppStrings.alreadyHaveAccountSignIn : AppStrings.back.toUpperCase(),
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.greyShade,
              ),
            ),
            SizedBox(height: 12.h),
          ],
        );
      }),
    );
  }
}
