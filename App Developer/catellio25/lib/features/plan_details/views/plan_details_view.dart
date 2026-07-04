import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../../global_widgets/custom_text/custom_text.dart';
import '../../../../global_widgets/custom_royel_appbar/custom_royel_appbar.dart';
import '../../../../core/app_routes/app_routes.dart';
import '../view_models/plan_details_controller.dart';

class PlanDetailsView extends GetView<PlanDetailsController> {
  const PlanDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CustomRoyelAppbar(
        titleName: AppStrings.planDetailsTitle,
        leftIcon: true,
        titleColor: AppColors.black,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: AppStrings.planDay,
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.greyShade.withOpacity(0.8),
            ),
            SizedBox(height: 4.h),
            CustomText(
              text: AppStrings.planDate,
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.greyShade.withOpacity(0.8),
            ),
            SizedBox(height: 12.h),
            CustomText(
              text: AppStrings.yourPerfectDate,
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
            SizedBox(height: 24.h),
            
            // Map Image Section
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.r),
                  child: Image.network(
                    "https://images.unsplash.com/photo-1524661135-423995f22d0b?auto=format&fit=crop&w=800&q=80", // Using a map/tablet photo placeholder
                    height: 180.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: 180.h,
                      color: AppColors.greyShade.withOpacity(0.1),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 16.h,
                  left: 16.w,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                    decoration: BoxDecoration(
                      color: AppColors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(100.r),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.location_on_outlined, color: AppColors.black, size: 16.sp),
                        SizedBox(width: 4.w),
                        CustomText(
                          text: AppStrings.viewFullRoute,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40.h),
            
            // Timeline Section
            _buildTimelineEvent(
              time: "5:00 PM",
              title: "Meet At Coffee Shop",
              description: "Start the evening with a curated brew at the artisan roastery. Minimal noise, maximum focus.",
              isLast: false,
            ),
            _buildTimelineEvent(
              time: "6:30 PM",
              title: "Nature Walk",
              description: "A gentle stroll through the botanical gardens. The golden hour lighting is optimized for this timeframe.",
              isLast: false,
            ),
            _buildTimelineEvent(
              time: "8:00 PM",
              title: "Dessert",
              description: "Conclude with a selection of refined pastries. Table is reserved under your name.",
              isLast: true,
            ),
            
            SizedBox(height: 24.h),
            
            // Estimated Cost Card
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
              decoration: BoxDecoration(
                color: const Color(0xFF181818), // Very dark grey/black
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: AppStrings.estimatedCost,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.greyShade.withOpacity(0.6),
                      ),
                      SizedBox(height: 4.h),
                      CustomText(
                        text: "\$95",
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                    decoration: BoxDecoration(
                      color: const Color(0xFF2A2A2A), // Dark pill background
                      borderRadius: BorderRadius.circular(100.r),
                      border: Border.all(color: Colors.white.withOpacity(0.05)),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.info_outline, color: AppColors.greyShade, size: 14.sp),
                        SizedBox(width: 6.w),
                        CustomText(
                          text: AppStrings.basedOnRecentAverages,
                          fontSize: 10.sp,
                          color: AppColors.greyShade,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),
            
            // Save Plan Button
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 16.h),
              decoration: BoxDecoration(
                color: AppColors.black,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Center(
                child: CustomText(
                  text: AppStrings.savePlan,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),
            ),
            SizedBox(height: 16.h),
            
            // Add To Calendar Button
            Center(
              child: GestureDetector(
                onTap: () => _showSuccessDialog(context),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 32.w),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: Colors.white, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.03),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: CustomText(
                    text: AppStrings.addToCalendar,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
              ),
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }

  Widget _buildTimelineEvent({
    required String time,
    required String title,
    required String description,
    required bool isLast,
  }) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Timeline indicator (Circle + Line)
          SizedBox(
            width: 32.w,
            child: Column(
              children: [
                Container(
                  width: 20.w,
                  height: 20.w,
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.black, width: 2),
                  ),
                  child: Center(
                    child: Container(
                      width: 6.w,
                      height: 6.w,
                      decoration: const BoxDecoration(
                        color: AppColors.black,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 1,
                      color: AppColors.greyShade.withOpacity(0.3),
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(width: 12.w),
          
          // Timeline Content
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: 32.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: time,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.greyShade,
                  ),
                  SizedBox(height: 4.h),
                  CustomText(
                    text: title,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                  SizedBox(height: 12.h),
                  Container(
                    padding: EdgeInsets.all(20.w),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(16.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.02),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: CustomText(
                      text: description,
                      fontSize: 14.sp,
                      color: AppColors.greyShade,
                     
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showSuccessDialog(BuildContext context) {
    Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Container(
          padding: EdgeInsets.all(24.w),
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(24.r),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Icon Placeholder Container
              Container(
                width: 160.w,
                height: 160.w,
                decoration: BoxDecoration(
                  color: const Color(0xFFF4F3ED), // Light beige color from image
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.event_available_outlined, color: AppColors.black, size: 64.sp),
                    SizedBox(height: 12.h),
                    CustomText(
                      text: "SUCCESS\nPLAN COMPLETED",
                      fontSize: 10.sp,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.center,
                      color: AppColors.black,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),
              
              CustomText(
                text: AppStrings.dateAddedSuccessfully,
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.center,
                color: AppColors.black,
              ),
              SizedBox(height: 12.h),
              
              CustomText(
                text: AppStrings.dateSavedDesc,
                fontSize: 14.sp,
                textAlign: TextAlign.center,
                color: AppColors.greyShade,
              ),
              SizedBox(height: 32.h),
              
              // View Calendar Button
              GestureDetector(
                onTap: () {
                  Get.back(); // close dialog
                  Get.toNamed(AppRoutes.calendarScreen);
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  decoration: BoxDecoration(
                    color: AppColors.black,
                    borderRadius: BorderRadius.circular(100.r),
                  ),
                  child: Center(
                    child: CustomText(
                      text: AppStrings.viewCalendar,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              
              // Back To Home Button
              GestureDetector(
                onTap: () {
                  Get.offAllNamed(AppRoutes.mainLayoutScreen, arguments: {'tab': 0});
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(100.r),
                  ),
                  child: Center(
                    child: CustomText(
                      text: AppStrings.backToHome,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: true,
    );
  }
}
