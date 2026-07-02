import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../core/theme/app_colors.dart';
import '../custom_text/custom_text.dart';

class ConfirmationDialog {

  static void show({
    required String title,
    required VoidCallback onYes,
  }) {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
          side: const BorderSide(color: Colors.black, width: 0),
        ),
        backgroundColor: AppColors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomText(
                text: title,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.black_03,
                textAlign: TextAlign.center,
                maxLines: 3,
              ),
              SizedBox(height: 24.h),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Get.back(); // Close dialog
                        onYes(); // Execute callback
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(color: AppColors.red, width: 1),
                        ),
                        child: Center(
                          child: CustomText(
                            text: "Yes",
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.red,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  // No Button
                  Expanded(
                    child: GestureDetector(
                      onTap: () => Get.back(), // Just close dialog
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        decoration: BoxDecoration(
                          color: AppColors.red,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Center(
                          child: CustomText(
                            text: "No",
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: true,
    );
  }
}