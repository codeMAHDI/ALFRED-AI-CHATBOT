import 'package:catellio25/global_widgets/custom_image/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../../utils/app_icons/app_icons.dart';
import '../../../../global_widgets/custom_text/custom_text.dart';
import '../../../../global_widgets/custom_text_field/custom_text_field.dart';
import '../../../../global_widgets/custom_button/custom_button.dart';
import '../view_models/profile_setup_controller.dart';

class ProfileSetupStep1 extends GetView<ProfileSetupController> {
  const ProfileSetupStep1({super.key});

  @override
  Widget build(BuildContext context) {
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
            fontSize: 16.sp,
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
            hintStyle: TextStyle(fontSize: 16.h, fontWeight: FontWeight.w400),
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
                      hintStyle: TextStyle(fontSize: 16.h, fontWeight: FontWeight.w400),
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
                          dropdownColor: AppColors.white,
                          borderRadius: BorderRadius.circular(16.r),
                          elevation: 2,
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
            hintStyle: TextStyle(fontSize: 16.h, fontWeight: FontWeight.w400),
            hintText: AppStrings.currentCity,
            fillColor: AppColors.white_50,
            fieldBorderColor: Colors.transparent,
            prefixIcon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: UnconstrainedBox(
                child: CustomImage(
                  imageSrc: AppIcons.locationIcon, 
                  height: 20.h,
                  width: 20.w,
                  imageColor: AppColors.greyShade,
                ),
              ),
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
            fontSize: 14,
            suffixIconColor: AppColors.white,
          ),
          SizedBox(height: 40.h),
        ],
      ),
    );
  }
}
