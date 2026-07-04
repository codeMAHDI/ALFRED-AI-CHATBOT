import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';
import '../../../utils/app_strings/app_strings.dart';
import '../../../global_widgets/custom_text/custom_text.dart';
import '../view_models/onboarding_controller.dart';
import '../widgets/onboarding_bottom_section.dart';
import '../widgets/onboarding_page_content.dart';

class OnboardingScreen extends GetView<OnboardingController> {
  const OnboardingScreen({super.key});

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
                return OnboardingPageContent(
                  page: controller.pages[index],
                  index: index,
                );
              },
            ),
          ),
          const OnboardingBottomSection(),
        ],
      ),
    );
  }
}
