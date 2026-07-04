import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../global_widgets/custom_text/custom_text.dart';
import '../../../../global_widgets/custom_image/custom_image.dart';
import '../models/onboarding_model.dart';
import 'onboarding_tag.dart';
import 'onboarding_feature_card.dart';

class OnboardingPageContent extends StatelessWidget {
  final OnboardingModel page;
  final int index;

  const OnboardingPageContent({super.key, required this.page, required this.index});

  @override
  Widget build(BuildContext context) {
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
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.greyShade,
            textAlign: TextAlign.center,
          ),
          if (page.tag1 != null || page.tag2 != null) ...[
            SizedBox(height: 24.h),
            if (page.tag1 != null) OnboardingTag(text: page.tag1!, icon: Icons.auto_awesome_outlined),
            if (page.tag1 != null && page.tag2 != null) SizedBox(height: 12.h),
            if (page.tag2 != null) OnboardingTag(text: page.tag2!, icon: Icons.verified_outlined),
          ],
          if (page.featureTitle1 != null) ...[
            SizedBox(height: 24.h),
            OnboardingFeatureCard(title: page.featureTitle1!, desc: page.featureDesc1!, icon: Icons.restaurant),
            SizedBox(height: 12.h),
            OnboardingFeatureCard(title: page.featureTitle2!, desc: page.featureDesc2!, icon: Icons.explore),
          ],
        ],
      ),
    );
  }
}
