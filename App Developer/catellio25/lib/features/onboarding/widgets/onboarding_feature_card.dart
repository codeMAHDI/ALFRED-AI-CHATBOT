import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../global_widgets/custom_text/custom_text.dart';

class OnboardingFeatureCard extends StatelessWidget {
  final String title;
  final String desc;
  final IconData icon;

  const OnboardingFeatureCard({
    super.key,
    required this.title,
    required this.desc,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.white_50,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: const BoxDecoration(
              color: AppColors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: AppColors.black, size: 24.sp),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: title,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
                SizedBox(height: 4.h),
                CustomText(
                  text: desc,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.greyShade,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
