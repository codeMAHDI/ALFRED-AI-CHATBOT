import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../global_widgets/custom_text/custom_text.dart';
import '../../../../global_widgets/custom_royel_appbar/custom_royel_appbar.dart';
import '../view_models/security_settings_controller.dart';

class SecuritySettingsScreen extends GetView<SecuritySettingsController> {
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
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                  SizedBox(height: 8.h),
                  CustomText(
                    text: "Ensure your account stays secure with a complex, unique password.",
                    fontSize: 14.sp,
                    color: AppColors.greyShade,

                  ),
                  SizedBox(height: 24.h),
                  
                  _buildPasswordField("Current Password", controller.isCurrentPasswordVisible, controller.toggleCurrentPassword),
                  SizedBox(height: 20.h),
                  
                  _buildPasswordField("New Password", controller.isNewPasswordVisible, controller.toggleNewPassword),
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
                  
                  _buildPasswordField("Confirm New Password", controller.isConfirmPasswordVisible, controller.toggleConfirmPassword),
                  
                  SizedBox(height: 32.h),
                  
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      decoration: BoxDecoration(
                        color: AppColors.black,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            text: "Update Password",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.white,
                          ),
                          SizedBox(width: 8.w),
                          Icon(Icons.arrow_forward, color: AppColors.white, size: 16.sp),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 40.h),
            
            CustomText(
              text: "Forgot your current password?",
              fontSize: 14.sp,
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

  Widget _buildPasswordField(String label, RxBool isVisible, VoidCallback onToggle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: label,
          fontSize: 12.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.greyShade,
        ),
        SizedBox(height: 8.h),
        Obx(() => Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: const Color(0xFFF0F0F0)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: isVisible.value ? "password123" : "••••••••",
                fontSize: 14.sp,
                color: AppColors.black,

              ),
              GestureDetector(
                onTap: onToggle,
                child: Icon(
                  isVisible.value ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                  color: AppColors.greyShade,
                  size: 20.sp,
                ),
              ),
            ],
          ),
        )),
      ],
    );
  }
}
