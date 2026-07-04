import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/app_colors.dart';
import '../../../utils/app_strings/app_strings.dart';
import '../../../global_widgets/custom_text/custom_text.dart';
import '../../../core/app_routes/app_routes.dart';
import 'package:get/get.dart';

class PlansScreen extends StatelessWidget {
  const PlansScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: CustomText(
          text: AppStrings.alfredTitle,
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.black,
        ),
        centerTitle: true,
        actions: [
          CircleAvatar(
            radius: 16.r,
            backgroundColor: AppColors.greyShade.withOpacity(0.2),
            child: Icon(Icons.person, color: AppColors.greyShade, size: 20.sp),
          ),
          SizedBox(width: 24.w),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 16.h, bottom: 120.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: AppStrings.recommendedDateIdeas,
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
            SizedBox(height: 8.h),
            CustomText(
              text: AppStrings.handpickedExperiences,
              fontSize: 14.sp,
              color: AppColors.greyShade,
            ),
            SizedBox(height: 32.h),
            
            _buildPlanCard(
              title: AppStrings.plan1Title,
              budget: AppStrings.plan1Budget,
              description: AppStrings.plan1Desc,
              imageUrl: "https://images.unsplash.com/photo-1497935586351-b67a49e012bf?auto=format&fit=crop&w=400&q=80",
            ),
            SizedBox(height: 24.h),
            _buildPlanCard(
              title: AppStrings.plan2Title,
              budget: AppStrings.plan2Budget,
              description: AppStrings.plan2Desc,
              imageUrl: "https://images.unsplash.com/photo-1551183053-bf91a1d81141?auto=format&fit=crop&w=400&q=80",
            ),
            SizedBox(height: 24.h),
            _buildPlanCard(
              title: AppStrings.plan3Title,
              budget: AppStrings.plan3Budget,
              description: AppStrings.plan3Desc,
              imageUrl: "https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?auto=format&fit=crop&w=400&q=80",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlanCard({
    required String title,
    required String budget,
    required String description,
    required String imageUrl,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            ),
            child: Image.network(
              imageUrl,
              height: 180.h,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                height: 180.h,
                color: AppColors.greyShade.withOpacity(0.1),
                child: Center(
                  child: Icon(Icons.image_outlined, color: AppColors.greyShade.withOpacity(0.3), size: 40.sp),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: CustomText(
                        text: title,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                    ),
                    Icon(Icons.bookmark_border, color: AppColors.black, size: 20.sp),
                  ],
                ),
                SizedBox(height: 8.h),
                CustomText(
                  text: budget,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.greyShade,
                ),
                SizedBox(height: 12.h),
                CustomText(
                  text: description,
                  fontSize: 14.sp,
                  color: AppColors.greyShade,
                ),
                SizedBox(height: 24.h),
                GestureDetector(
                  onTap: () => Get.toNamed(AppRoutes.planDetailsScreen),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    decoration: BoxDecoration(
                      color: AppColors.black,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Center(
                      child: CustomText(
                        text: AppStrings.viewPlan,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
