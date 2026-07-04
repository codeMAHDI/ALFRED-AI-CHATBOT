import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../../global_widgets/custom_text/custom_text.dart';
import '../../../../global_widgets/custom_button/custom_button.dart';
import '../view_models/profile_setup_controller.dart';

class ProfileSetupStep2 extends GetView<ProfileSetupController> {
  const ProfileSetupStep2({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 24.h),
          CustomText(
            text: AppStrings.whatDoYouEnjoy,
            fontSize: 48.sp,
            textAlign: TextAlign.start,
            maxLines: 5,
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
          SizedBox(height: 12.h),
          CustomText(
            text: AppStrings.selectYourInterests,
            fontSize: 16.sp,
            color: AppColors.greyShade,
          ),
          SizedBox(height: 32.h),
          
          // Grid of interests
          Obx(() => Wrap(
            spacing: 16.w,
            runSpacing: 16.h,
            children: controller.interests.map((interest) {
              final isSelected = controller.selectedInterests.contains(interest.title);
              final isFullWidth = interest.title == AppStrings.luxuryExperiences;
              
              return GestureDetector(
                onTap: () => controller.toggleInterest(interest.title),
                child: Container(
                  width: isFullWidth ? double.infinity : (Get.width - 48.w - 16.w) / 2,
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.black : AppColors.white,
                    borderRadius: BorderRadius.circular(16.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        interest.iconPath,
                        height: 17.sp,
                        width: 17.sp,
                        colorFilter: ColorFilter.mode(
                          isSelected ? AppColors.white : AppColors.black, 
                          BlendMode.srcIn
                        ),
                      ),
                      SizedBox(height: 16.h),
                      CustomText(
                        text: interest.title,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: isSelected ? AppColors.white : AppColors.black,
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          )),
          SizedBox(height: 60.h),

          // Continue
          CustomButton(
            onTap: controller.onNext,
            title: AppStrings.continueTxt,
            suffixIcon: Icons.arrow_forward,
            suffixIconColor: AppColors.white,
            fontSize: 14,
          ),
          SizedBox(height: 40.h),
        ],
      ),
    );
  }
}
