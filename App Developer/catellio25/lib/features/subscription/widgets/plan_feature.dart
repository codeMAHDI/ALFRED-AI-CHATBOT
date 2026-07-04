import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../global_widgets/custom_text/custom_text.dart';

class PlanFeature extends StatelessWidget {
  final String text;
  final bool active;
  final IconData? icon;

  const PlanFeature({
    super.key,
    required this.text,
    required this.active,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        children: [
          Icon(
            icon ?? (active ? Icons.check_circle_outline : Icons.block),
            color: active ? AppColors.greyShade : AppColors.white_50,
            size: 20.sp,
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: CustomText(
              text: text,
              fontSize: 14.sp,
              color: active ? AppColors.black : AppColors.greyShade.withOpacity(0.5),
              decoration: active ? null : TextDecoration.lineThrough,
            ),
          ),
        ],
      ),
    );
  }
}
