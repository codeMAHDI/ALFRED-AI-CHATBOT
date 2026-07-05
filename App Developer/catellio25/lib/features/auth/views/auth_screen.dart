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
import '../view_models/auth_controller.dart';

class AuthScreen extends GetView<AuthController> {
  const AuthScreen({super.key});

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
                height: 119.h,
                width: 119.h,
                boxFit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 30.h),
            // Welcome Text
            Center(
              child: CustomText(
                text: AppStrings.welcomeTo,
                fontSize: 48.sp,
                fontWeight: FontWeight.w300,
                color: AppColors.black,
                textAlign: TextAlign.center,
              ),
            ),
            Center(
              child: CustomText(
                text: AppStrings.alfredTitle,
                fontSize: 48.sp,
                fontWeight: FontWeight.w900,
                color: AppColors.black,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 10.h),
            Center(
              child: CustomText(
                text: AppStrings.yourSilentPartner,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.greyShade,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 40.h),

            // Email Field
            CustomText(
              text: AppStrings.emailAddress,
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.greyShade,
            ),
            SizedBox(height: 8.h),
            CustomTextField(
              hintStyle: TextStyle(fontSize: 16.h, fontWeight: FontWeight.w400),
              hintText: AppStrings.emailHint,
              keyboardType: TextInputType.emailAddress,
              onChanged: (val) => controller.emailController.value = val,
            ),
            SizedBox(height: 20.h),

            // Password Field
            CustomText(
              text: AppStrings.password,
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
            ),
            SizedBox(height: 12.h),
            Align(
              alignment: Alignment.centerRight,
              child: CustomButton(
                onTap: controller.forgotPassword,
                title: "Forget Password...",
                height: 30.h,
                width: 140.w,
                fillColor: Colors.transparent,
                textColor: AppColors.black,
                fontSize: 12.sp,
              ),
            ),
            SizedBox(height: 30.h),

            // Sign In Button
            CustomButton(
              onTap: controller.signIn,
              title: AppStrings.signInCaps,
              fontSize: 14,
            ),
            SizedBox(height: 30.h),

            // Or Continue With
            Center(
              child: CustomText(
                text: AppStrings.orContinueWith,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.greyShade,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20.h),

            // Social Buttons
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    onTap: controller.signInWithGoogle,
                    title: AppStrings.google,
                    fillColor: AppColors.white,
                    textColor: AppColors.black,
                    isBorder: true,
                    imageSrc: AppIcons.googleIcon,
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: CustomButton(
                    onTap: controller.signInWithApple,
                    title: AppStrings.apple,
                    fillColor: AppColors.black,
                    textColor: AppColors.white,
                    imageSrc: AppIcons.appleIcon,
                    imageColor: AppColors.white,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.h),

            //  Create an account
            Center(
              child: GestureDetector(
                onTap: () => Get.toNamed(AppRoutes.signUpScreen),
                child: RichText(
                  text: TextSpan(
                    text: AppStrings.newHere,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColors.greyShade,
                    ),
                    children: [
                      TextSpan(
                        text: AppStrings.createAnAccount,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 30.h),

            // Terms
            Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: AppStrings.byContinuing,
                  style: TextStyle(fontSize: 12.sp, color: AppColors.greyShade),
                  children: [
                    TextSpan(text: "\n"),
                    TextSpan(
                      text: AppStrings.termsOfService,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: AppColors.black,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    TextSpan(
                      text: AppStrings.andText,
                      style: TextStyle(fontSize: 12.sp, color: AppColors.greyShade),
                    ),
                    TextSpan(
                      text: AppStrings.privacyPolicy,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: AppColors.black,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
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
