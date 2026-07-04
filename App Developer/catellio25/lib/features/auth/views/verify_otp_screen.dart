import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../../global_widgets/custom_text/custom_text.dart';
import '../../../../global_widgets/custom_button/custom_button.dart';
import '../../../../global_widgets/custom_pin_code/custom_pin_code.dart';
import '../view_models/auth_controller.dart';

class VerifyOtpScreen extends GetView<AuthController> {
  const VerifyOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.black, size: 24.sp),
          onPressed: () => Get.back(),
        ),
        centerTitle: true,
        title: CustomText(
          text: AppStrings.alfred,
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.black,
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            // Title
            Center(
              child: CustomText(
                text: AppStrings.verifyYourIdentity,
                fontSize: 28.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
            ),
            SizedBox(height: 12.h),
            // Subtitle
            Center(
              child: Obx(() => CustomText(
                text: "${AppStrings.weSentCode}\n${controller.otpEmail.value.isNotEmpty ? controller.otpEmail.value : 'your email'}",
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.greyShade,
                textAlign: TextAlign.center,
              )),
            ),
            SizedBox(height: 30.h),

            // OTP Pin Code
            CustomPinCode(
              length: 6,
              activeColor: AppColors.black,
              onChanged: (val) => controller.otpController.value = val,
              onCompleted: (val) {
                controller.otpController.value = val;
              },
            ),
            SizedBox(height: 24.h),

            // Resend Link
            Center(
              child: GestureDetector(
                onTap: controller.resendOtp,
                child: RichText(
                  text: TextSpan(
                    text: AppStrings.didntReceiveCode,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.greyShade,
                    ),
                    children: [
                      TextSpan(
                        text: AppStrings.resendLink,
                        style: TextStyle(
                          fontSize: 15.sp,
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
            SizedBox(height: 40.h),

            // Verify Button
            CustomButton(
              onTap: controller.verifyOtp,
              title: AppStrings.verifyCaps,
              fontSize: 14,
            ),
          ],
        ),
      ),
      ));
  }
}
