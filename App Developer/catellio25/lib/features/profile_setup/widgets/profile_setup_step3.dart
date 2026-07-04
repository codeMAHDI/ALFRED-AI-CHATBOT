import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../../utils/app_images/app_images.dart';
import '../../../../global_widgets/custom_text/custom_text.dart';
import '../../../../global_widgets/custom_text_field/custom_text_field.dart';
import '../../../../global_widgets/custom_button/custom_button.dart';
import '../view_models/profile_setup_controller.dart';

class ProfileSetupStep3 extends GetView<ProfileSetupController> {
  const ProfileSetupStep3({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 24.h),
          CustomText(
            text: AppStrings.preferredDateBudget,
            fontSize: 28.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
          SizedBox(height: 12.h),
          CustomText(
            text: AppStrings.helpsAlfredTailor,
            fontSize: 18.sp,
            color: AppColors.greyShade,
          ),
          SizedBox(height: 32.h),
          
          // Budget Grid
          Obx(() => Wrap(
            spacing: 16.w,
            runSpacing: 16.h,
            children: controller.predefinedBudgets.map((budget) {
              final isSelected = controller.selectedBudget.value == budget.title;
              final isFullWidth = budget.title == AppStrings.exceptional || budget.title == AppStrings.premiumBudget;
              
              return GestureDetector(
                onTap: () => controller.selectBudget(budget.title),
                child: Container(
                  width: isFullWidth ? double.infinity : (Get.width - 48.w - 16.w) / 2,
                  padding: EdgeInsets.all(20.w),
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.white : AppColors.white_50,
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(
                      color: isSelected ? AppColors.black : Colors.transparent,
                      width: 1.5,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: budget.title,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.greyShade,
                          ),
                          SizedBox(height: 4.h),
                          CustomText(
                            text: budget.price,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.black,
                          ),
                        ],
                      ),
                      if (isSelected)
                        Icon(Icons.check_circle, color: AppColors.black, size: 24.sp),
                    ],
                  ),
                ),
              );
            }).toList(),
          )),
          SizedBox(height: 24.h),

          // Custom amount
          CustomText(
            text: AppStrings.enterCustomAmount,
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.greyShade,
          ),
          SizedBox(height: 8.h),
          CustomTextField(
            hintStyle: TextStyle(fontSize: 16.h, fontWeight: FontWeight.w400),
            hintText: AppStrings.customAmountHint,
            keyboardType: TextInputType.number,
            fillColor: AppColors.white_50,
            fieldBorderColor: Colors.transparent,
            onChanged: (val) {
              controller.customBudgetController.value = val;
              if (val.isNotEmpty) {
                controller.selectedBudget.value = 'Custom';
              }
            },
          ),
          SizedBox(height: 32.h),

          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: Image.asset(
              AppImages.profileSetup3,
              width: double.infinity,
              height: 200.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 40.h),

          // Skip & Continue
          Center(
            child: GestureDetector(
              onTap: controller.onSkip,
              child: Padding(
                padding: EdgeInsets.all(16.w),
                child: CustomText(
                  text: AppStrings.skip,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
            ),
          ),
          SizedBox(height: 16.h),
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
