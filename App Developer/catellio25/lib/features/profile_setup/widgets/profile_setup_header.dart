import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../../global_widgets/custom_text/custom_text.dart';
import '../view_models/profile_setup_controller.dart';

class ProfileSetupHeader extends GetView<ProfileSetupController> {
  const ProfileSetupHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      child: Column(
        children: [
          CustomText(
            text: AppStrings.alfredTitle,
            fontSize: 24.sp,
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
}
