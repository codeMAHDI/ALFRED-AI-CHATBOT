import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../../utils/app_icons/app_icons.dart';
import '../../../../utils/app_images/app_images.dart';
import '../../../../global_widgets/custom_text/custom_text.dart';
import '../../../../global_widgets/custom_text_field/custom_text_field.dart';
import '../../../../global_widgets/custom_button/custom_button.dart';
import '../view_models/profile_setup_view_model.dart';

class ProfileSetupView extends GetView<ProfileSetupViewModel> {
  const ProfileSetupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: PageView(
                controller: controller.pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _buildStep1(),
                  _buildStep2(),
                  _buildStep3(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      child: Column(
        children: [
          CustomText(
            text: AppStrings.alfredTitle,
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.black,
          ),
          SizedBox(height: 16.h),
          Obx(() {
            double progress = controller.currentStep.value / 3;
            return LinearProgressIndicator(
              value: progress,
              backgroundColor: AppColors.white_50,
              valueColor: const AlwaysStoppedAnimation<Color>(AppColors.black),
              minHeight: 4.h,
              borderRadius: BorderRadius.circular(4.r),
            );
          }),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(() => CustomText(
                text: "Step ${controller.currentStep.value} of 3",
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.greyShade,
              )),
              CustomText(
                text: AppStrings.identityVerification,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.greyShade,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStep1() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 24.h),
          CustomText(
            text: AppStrings.tellUsAboutYourself,
            fontSize: 28.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
          SizedBox(height: 12.h),
          CustomText(
            text: AppStrings.alfredRequiresDetails,
            fontSize: 14.sp,
            color: AppColors.greyShade,
          ),
          SizedBox(height: 32.h),
          
          // Full Name
          CustomText(
            text: AppStrings.fullName,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
          SizedBox(height: 8.h),
          CustomTextField(
            hintText: AppStrings.eGName,
            fillColor: AppColors.white_50,
            fieldBorderColor: Colors.transparent,
            onChanged: (val) => controller.nameController.value = val,
          ),
          SizedBox(height: 20.h),
          
          Row(
            children: [
              // Age
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: AppStrings.age,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
                    SizedBox(height: 8.h),
                    CustomTextField(
                      hintText: AppStrings.years,
                      keyboardType: TextInputType.number,
                      fillColor: AppColors.white_50,
                      fieldBorderColor: Colors.transparent,
                      onChanged: (val) => controller.ageController.value = val,
                    ),
                  ],
                ),
              ),
              SizedBox(width: 16.w),
              // Gender
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: AppStrings.gender,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
                    SizedBox(height: 8.h),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      decoration: BoxDecoration(
                        color: AppColors.white_50,
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Obx(() => DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: controller.selectedGender.value,
                          isExpanded: true,
                          icon: Icon(Icons.keyboard_arrow_down, color: AppColors.greyShade),
                          items: controller.genders.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value, 
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: value == 'Select' ? AppColors.gery2 : AppColors.black_03
                                )
                              ),
                            );
                          }).toList(),
                          onChanged: (val) {
                            if (val != null) controller.selectedGender.value = val;
                          },
                        ),
                      )),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),

          // Location
          CustomText(
            text: AppStrings.location,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
          SizedBox(height: 8.h),
          CustomTextField(
            hintText: AppStrings.currentCity,
            fillColor: AppColors.white_50,
            fieldBorderColor: Colors.transparent,
            prefixIcon: Padding(
              padding: EdgeInsets.all(12.w),
              child: SvgPicture.asset(AppIcons.locationIcon, colorFilter: const ColorFilter.mode(AppColors.greyShade, BlendMode.srcIn)),
            ),
            onChanged: (val) => controller.locationController.value = val,
          ),
          SizedBox(height: 40.h),
          
          // Encryption Banner
          Container(
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              color: AppColors.white_50,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.auto_awesome, color: AppColors.black, size: 24.sp),
                SizedBox(width: 16.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: AppStrings.dataEncryptionActive,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                      SizedBox(height: 4.h),
                      CustomText(
                        text: AppStrings.encryptionDesc,
                        fontSize: 12.sp,
                        color: AppColors.greyShade,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 40.h),

          // Continue
          CustomButton(
            onTap: controller.onNext,
            title: AppStrings.continueTxt,
            suffixIcon: Icons.arrow_forward,
            suffixIconColor: AppColors.white,
          ),
          SizedBox(height: 40.h),
        ],
      ),
    );
  }

  Widget _buildStep2() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 24.h),
          CustomText(
            text: AppStrings.whatDoYouEnjoy,
            fontSize: 28.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
          SizedBox(height: 12.h),
          CustomText(
            text: AppStrings.selectYourInterests,
            fontSize: 14.sp,
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
                        height: 24.sp,
                        width: 24.sp,
                        colorFilter: ColorFilter.mode(
                          isSelected ? AppColors.white : AppColors.black, 
                          BlendMode.srcIn
                        ),
                      ),
                      SizedBox(height: 16.h),
                      CustomText(
                        text: interest.title,
                        fontSize: 14.sp,
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
          ),
          SizedBox(height: 40.h),
        ],
      ),
    );
  }

  Widget _buildStep3() {
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
            fontSize: 14.sp,
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
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.greyShade,
                          ),
                          SizedBox(height: 4.h),
                          CustomText(
                            text: budget.price,
                            fontSize: 18.sp,
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

          // Image from Figma
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: Image.asset(
              AppImages.profileSetup3,
              width: double.infinity,
              height: 180.h,
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
          ),
          SizedBox(height: 40.h),
        ],
      ),
    );
  }
}
