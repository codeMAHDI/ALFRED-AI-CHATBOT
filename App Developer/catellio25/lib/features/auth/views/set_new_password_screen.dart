import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../../global_widgets/custom_text/custom_text.dart';
import '../../../../global_widgets/custom_text_field/custom_text_field.dart';
import '../../../../global_widgets/custom_button/custom_button.dart';
import '../../../../global_widgets/custom_royel_appbar/custom_royel_appbar.dart';
import '../view_models/auth_controller.dart';

class SetNewPasswordScreen extends GetView<AuthController> {
  const SetNewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CustomRoyelAppbar(
        titleName: "Set New Password",
        titleColor: AppColors.black,
        leftIcon: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            CustomText(
              text: "Create New Password",
              fontSize: 28.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
            SizedBox(height: 12.h),
            CustomText(
              text: "Your new password must be different from previous used passwords.",
              fontSize: 14.sp,
              color: AppColors.greyShade,
              maxLines: 3,
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 40.h),
            
            CustomText(
              text: "New Password",
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.greyShade,
            ),
            SizedBox(height: 8.h),
            CustomTextField(
              hintText: "••••••••",
              hintStyle: TextStyle(fontSize: 16.h, fontWeight: FontWeight.w400),
              isPassword: true,
              onChanged: (val) => controller.passwordController.value = val,
              fillColor: AppColors.white,
              fieldBorderColor: const Color(0xFFF0F0F0),
              fieldBorderRadius: 12.r,
            ),
            SizedBox(height: 20.h),
            
            CustomText(
              text: "Confirm Password",
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.greyShade,
            ),
            SizedBox(height: 8.h),
            CustomTextField(
              hintText: "••••••••",
              hintStyle: TextStyle(fontSize: 16.h, fontWeight: FontWeight.w400),
              isPassword: true,
              onChanged: (val) => controller.confirmPasswordController.value = val,
              fillColor: AppColors.white,
              fieldBorderColor: const Color(0xFFF0F0F0),
              fieldBorderRadius: 12.r,
            ),
            SizedBox(height: 40.h),
            
            CustomButton(
              onTap: () {
                // Assuming we reset successfully, go back to auth screen
                Get.offAllNamed(AppRoutes.authScreen);
              },
              title: "Update Password",
              fontSize: 14,
            ),
          ],
        ),
      ),
    );
  }
}
