import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../../global_widgets/custom_text/custom_text.dart';
import '../../../../global_widgets/custom_button/custom_button.dart';
import '../../../../global_widgets/custom_pin_code/custom_pin_code.dart';
import '../view_models/otp_view_model.dart';

class OtpView extends GetView<OtpViewModel> {
  const OtpView({super.key});

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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.h),
            // Title
            CustomText(
              text: AppStrings.verifyYourIdentity,
              fontSize: 28.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
            SizedBox(height: 12.h),
            // Subtitle
            Obx(() => RichText(
              text: TextSpan(
                text: "${AppStrings.weSentCode}\n",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.greyShade,
                  height: 1.5,
                ),
                children: [
                  TextSpan(
                    text: controller.email.value.isNotEmpty
                        ? controller.email.value
                        : "your email",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
            )),
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
            GestureDetector(
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
            SizedBox(height: 40.h),

            // Verify Button
            CustomButton(
              onTap: controller.verifyOtp,
              title: AppStrings.verifyCaps,
            ),
          ],
        ),
      ),
    );
  }
}
