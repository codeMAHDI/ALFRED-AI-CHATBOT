import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../../global_widgets/custom_text/custom_text.dart';

class PlanCard extends StatelessWidget {
  final String tag;
  final String title;
  final String price;
  final List<Widget> features;
  final String buttonText;
  final bool isPopular;
  final bool isButtonDark;

  const PlanCard({
    super.key,
    required this.tag,
    required this.title,
    required this.price,
    required this.features,
    required this.buttonText,
    required this.isPopular,
    required this.isButtonDark,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        Container(
          padding: EdgeInsets.all(24.w),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(color: AppColors.white_50, width: 2),
            boxShadow: [
              if (isPopular)
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: isPopular ? 8.h : 0),
              CustomText(
                text: tag,
                fontSize: 10.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.greyShade,
              ),
              SizedBox(height: 8.h),
              CustomText(
                text: title,
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
              SizedBox(height: 4.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  CustomText(
                    text: price.split(' ')[0],
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w900,
                    color: AppColors.black,
                  ),
                  SizedBox(width: 4.w),
                  CustomText(
                    text: price.substring(price.indexOf(' ')),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.greyShade,
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              ...features,
              SizedBox(height: 32.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 16.h),
                decoration: BoxDecoration(
                  color: isButtonDark ? AppColors.black : AppColors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  border: isButtonDark ? null : Border.all(color: AppColors.white_50),
                ),
                child: Center(
                  child: CustomText(
                    text: buttonText,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: isButtonDark ? AppColors.white : AppColors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
        if (isPopular)
          Positioned(
            top: -12.h,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: AppColors.black,
                borderRadius: BorderRadius.circular(100.r),
              ),
              child: CustomText(
                text: AppStrings.mostPopular,
                fontSize: 10.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),
          ),
      ],
    );
  }
}
