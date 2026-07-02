import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';
import '../../../utils/app_strings/app_strings.dart';
import '../../../global_widgets/custom_button/custom_button.dart';
import '../../../global_widgets/custom_text/custom_text.dart';
import '../../../global_widgets/custom_image/custom_image.dart';
import '../models/onboarding_model.dart';
import '../view_models/onboarding_view_model.dart';

class OnboardingView extends GetView<OnboardingViewModel> {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: CustomText(
          text: AppStrings.alfred,
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.black,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: controller.pageController,
              onPageChanged: controller.onPageChanged,
              itemCount: controller.pages.length,
              itemBuilder: (context, index) {
                return _buildPageContent(controller.pages[index], index);
              },
            ),
          ),
          _buildBottomSection(),
        ],
      ),
    );
  }

  Widget _buildPageContent(OnboardingModel page, int index) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Illustration
          if (page.imagePath != null)
            CustomImage(
              imageSrc: page.imagePath!,
              height: (page.imageHeight ?? 250).h,
              width: (page.imageWidth ?? 292).w,
              boxFit: BoxFit.contain,
            ),
          SizedBox(height: 40.h),
          CustomText(
            text: page.title,
            fontSize: 28.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.black,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16.h),
          CustomText(
            text: page.subtitle,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.greyShade,
            textAlign: TextAlign.center,
          ),
          if (page.tag1 != null || page.tag2 != null) ...[
            SizedBox(height: 24.h),
            if (page.tag1 != null) _buildTag(page.tag1!, Icons.auto_awesome_outlined),
            if (page.tag1 != null && page.tag2 != null) SizedBox(height: 12.h),
            if (page.tag2 != null) _buildTag(page.tag2!, Icons.verified_outlined),
          ],
          if (page.featureTitle1 != null) ...[
            SizedBox(height: 24.h),
            _buildFeatureCard(page.featureTitle1!, page.featureDesc1!, Icons.restaurant),
            SizedBox(height: 12.h),
            _buildFeatureCard(page.featureTitle2!, page.featureDesc2!, Icons.explore),
          ],
        ],
      ),
    );
  }

  Widget _buildTag(String text, IconData icon) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: AppColors.white_50,
        borderRadius: BorderRadius.circular(100.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18.sp, color: AppColors.black),
          SizedBox(width: 10.w),
          CustomText(
            text: text,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard(String title, String desc, IconData icon) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.white_50,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: const BoxDecoration(
              color: AppColors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: AppColors.black, size: 24.sp),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: title,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
                SizedBox(height: 4.h),
                CustomText(
                  text: desc,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.greyShade,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      child: Obx(() {
        int index = controller.currentPage.value;
        return Column(
          children: [
            // Page Indicators
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
