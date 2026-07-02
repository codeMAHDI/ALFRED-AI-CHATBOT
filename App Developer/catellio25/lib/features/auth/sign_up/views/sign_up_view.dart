import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/app_routes/app_routes.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../../utils/app_icons/app_icons.dart';
import '../../../../global_widgets/custom_text/custom_text.dart';
import '../../../../global_widgets/custom_text_field/custom_text_field.dart';
import '../../../../global_widgets/custom_button/custom_button.dart';
import '../../../../global_widgets/custom_image/custom_image.dart';
import '../view_models/sign_up_view_model.dart';

class SignUpView extends GetView<SignUpViewModel> {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60.h),
            // Logo
            Center(
              child: CustomImage(
                imageSrc: AppIcons.splashIcon,
                height: 100.h,
                width: 100.h,
                boxFit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 20.h),
            // Title
            Center(
              child: CustomText(
                text: AppStrings.joinAlfred,
                fontSize: 28.sp,
                fontWeight: FontWeight.w900,
                color: AppColors.black,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 8.h),
            Center(
              child: CustomText(
                text: AppStrings.yourPersonalConcierge,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.greyShade,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 40.h),

            // Name Field
            CustomText(
              text: AppStrings.nameCaps,
              fontSize: 11.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.greyShade,
            ),
            SizedBox(height: 8.h),
            CustomTextField(
              hintText: AppStrings.nameHint,
              keyboardType: TextInputType.name,
              fillColor: AppColors.white_50,
              fieldBorderColor: Colors.transparent,
              onChanged: (val) => controller.nameController.value = val,
            ),
            SizedBox(height: 20.h),

            // Email Field
            CustomText(
              text: AppStrings.emailCaps,
              fontSize: 11.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.greyShade,
            ),
            SizedBox(height: 8.h),
            CustomTextField(
              hintText: AppStrings.emailSignupHint,
              keyboardType: TextInputType.emailAddress,
              fillColor: AppColors.white_50,
              fieldBorderColor: Colors.transparent,
              onChanged: (val) => controller.emailController.value = val,
            ),
            SizedBox(height: 20.h),

            // Password Field
            CustomText(
              text: AppStrings.passwordCaps,
              fontSize: 11.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.greyShade,
            ),
            SizedBox(height: 8.h),
            CustomTextField(
              hintText: "••••••••",
              isPassword: true,
              fillColor: AppColors.white_50,
              fieldBorderColor: Colors.transparent,
              onChanged: (val) => controller.passwordController.value = val,
            ),
            SizedBox(height: 20.h),

            // Confirm Password Field
            CustomText(
              text: AppStrings.confirmPasswordCaps,
              fontSize: 11.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.greyShade,
            ),
            SizedBox(height: 8.h),
            CustomTextField(
              hintText: "••••••••",
              isPassword: true,
              fillColor: AppColors.white_50,
              fieldBorderColor: Colors.transparent,
              onChanged: (val) => controller.confirmPasswordController.value = val,
            ),
            SizedBox(height: 16.h),

            // Terms Text
            Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: AppStrings.byCreatingAccount,
                  style: TextStyle(fontSize: 11.sp, color: AppColors.greyShade),
                  children: [
                    TextSpan(
                      text: AppStrings.termsOfService,
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: AppColors.black,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    TextSpan(text: "\n"),
                    TextSpan(
                      text: AppStrings.andText,
                      style: TextStyle(fontSize: 11.sp, color: AppColors.greyShade),
                    ),
                    TextSpan(
                      text: AppStrings.privacyPolicy,
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: AppColors.black,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    TextSpan(
                      text: ".",
                      style: TextStyle(fontSize: 11.sp, color: AppColors.greyShade),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24.h),

            // Create Account Button
            CustomButton(
              onTap: controller.createAccount,
              title: AppStrings.createAccountCaps,
            ),
            SizedBox(height: 24.h),

            // Already have an account? Sign in
            Center(
              child: GestureDetector(
                onTap: () => Get.back(),
                child: RichText(
                  text: TextSpan(
                    text: AppStrings.alreadyHaveAccount,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.greyShade,
                    ),
                    children: [
                      TextSpan(
                        text: AppStrings.signInLink,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}
