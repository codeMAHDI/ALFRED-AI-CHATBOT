import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../global_widgets/custom_text/custom_text.dart';
import '../../../../global_widgets/custom_text_field/custom_text_field.dart';
import '../../../../global_widgets/custom_button/custom_button.dart';
import '../../../../global_widgets/custom_royel_appbar/custom_royel_appbar.dart';
import '../view_models/profile_controller.dart';

class SecuritySettingsScreen extends GetView<ProfileController> {
  const SecuritySettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CustomRoyelAppbar(
        titleName: "Security",
        titleColor: AppColors.black,
        leftIcon: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(24.w),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "Update Password",
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                  SizedBox(height: 8.h),
                  CustomText(
                    text: "Ensure your account stays secure with a complex, unique password.",
                    fontSize: 16.sp,
                    color: AppColors.greyShade,
                    textAlign: TextAlign.start,
                    maxLines: 3,

                  ),
                  SizedBox(height: 24.h),
                  
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "Current Password",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.greyShade,
                      ),
                      SizedBox(height: 8.h),
                      CustomTextField(
                        hintText: "••••••••",
                        isPassword: true,
                        fillColor: AppColors.white,
                        fieldBorderColor: const Color(0xFFF0F0F0),
                        fieldBorderRadius: 12.r,
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "New Password",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.greyShade,
                      ),
                      SizedBox(height: 8.h),
                      CustomTextField(
                        hintText: "••••••••",
                        isPassword: true,
                        fillColor: AppColors.white,
                        fieldBorderColor: const Color(0xFFF0F0F0),
                        fieldBorderRadius: 12.r,
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  
                  // Password strength indicator
                  Row(
                    children: [
                      Expanded(child: Container(height: 4.h, decoration: BoxDecoration(color: const Color(0xFFE0E0E0), borderRadius: BorderRadius.circular(2.r)))),
                      SizedBox(width: 4.w),
                      Expanded(child: Container(height: 4.h, decoration: BoxDecoration(color: const Color(0xFFE0E0E0), borderRadius: BorderRadius.circular(2.r)))),
                      SizedBox(width: 4.w),
                      Expanded(child: Container(height: 4.h, decoration: BoxDecoration(color: const Color(0xFFE0E0E0), borderRadius: BorderRadius.circular(2.r)))),
                      SizedBox(width: 4.w),
                      Expanded(child: Container(height: 4.h, decoration: BoxDecoration(color: const Color(0xFFE0E0E0), borderRadius: BorderRadius.circular(2.r)))),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  CustomText(
                    text: "Min. 8 characters with a mix of letters and numbers.",
                    fontSize: 12.sp,
                    color: AppColors.greyShade,

                  ),
                  SizedBox(height: 20.h),
                  
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "Confirm New Password",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.greyShade,
                      ),
                      SizedBox(height: 8.h),
                      CustomTextField(
                        hintText: "••••••••",
                        isPassword: true,
                        fillColor: AppColors.white,
                        fieldBorderColor: const Color(0xFFF0F0F0),
                        fieldBorderRadius: 12.r,
                      ),
                    ],
                  ),
                  
                  SizedBox(height: 32.h),
                  
                  CustomButton(
                    onTap: () => Get.back(),
                    title: "Update Password",
                    fontSize: 14.sp,
                    fillColor: AppColors.black,
                    textColor: AppColors.white,
                    borderRadius: 12.r,
                    suffixIcon: Icons.arrow_forward,
                    suffixIconColor: AppColors.white,
                    imageSize: 16.sp,
                    height: 52.h,
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 40.h),
            
            CustomText(
              text: "Forgot your current password?",
              fontSize: 16.sp,
              color: AppColors.greyShade,
            ),
            SizedBox(height: 8.h),
            GestureDetector(
              onTap: () {},
              child: CustomText(
                text: "Reset via email",
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ),
    );
  }

}
