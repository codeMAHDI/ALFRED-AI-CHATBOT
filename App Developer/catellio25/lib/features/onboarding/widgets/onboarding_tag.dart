import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../global_widgets/custom_text/custom_text.dart';

class OnboardingTag extends StatelessWidget {
  final String text;
  final IconData icon;

  const OnboardingTag({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: AppColors.white_50,
        borderRadius: BorderRadius.circular(100.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18.sp, color: AppColors.black),
          SizedBox(width: 10.w),
          CustomText(
            text: text,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
        ],
      ),
    );
  }
}
