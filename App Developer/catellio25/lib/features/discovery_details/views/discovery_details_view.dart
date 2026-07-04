import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../global_widgets/custom_text/custom_text.dart';
import '../view_models/discovery_details_controller.dart';

class DiscoveryDetailsView extends GetView<DiscoveryDetailsController> {
  const DiscoveryDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Image with Back and Bookmark buttons
            Stack(
              children: [
                Image.network(
                  "https://images.unsplash.com/photo-1514933651103-005eec06c04b?q=80&w=800&auto=format&fit=crop",
                  width: double.infinity,
                  height: 350.h,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: double.infinity,
                    height: 350.h,
                    color: AppColors.greyShade.withOpacity(0.2),
                  ),
                ),
                Positioned(
                  top: 50.h, // Safe area roughly
                  left: 24.w,
                  right: 24.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: Container(
                          width: 40.w,
                          height: 40.w,
                          decoration: const BoxDecoration(
                            color: AppColors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.arrow_back, color: AppColors.black, size: 20.sp),
                        ),
                      ),
                      Container(
                        width: 40.w,
                        height: 40.w,
                        decoration: const BoxDecoration(
                          color: AppColors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.bookmark_border, color: AppColors.black, size: 20.sp),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            
            // Content
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF4F3ED),
                          borderRadius: BorderRadius.circular(100.r),
                        ),
                        child: CustomText(
                          text: "FINE DINING",
                          fontSize: 8.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                        decoration: BoxDecoration(
                          color: AppColors.black,
                          borderRadius: BorderRadius.circular(100.r),
                        ),
                        child: CustomText(
                          text: "EXCLUSIVE",
                          fontSize: 8.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  
                  CustomText(
                    text: "The Obsidian\nRoom",
                    fontSize: 32.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                  SizedBox(height: 16.h),
                  
                  CustomText(
                    text: "An immersive culinary journey in total darkness, curated by Chef Elena Roux. Experience flavor, texture, and aroma in their purest forms, stripped of visual bias.",
                    fontSize: 14.sp,
                    color: AppColors.greyShade,
                  ),
                  SizedBox(height: 32.h),
                  
                  CustomText(
                    text: "The Experience",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                  SizedBox(height: 16.h),
                  
                  _buildExperienceCard(
                    icon: Icons.restaurant,
                    title: "Sensory Menu",
                    desc: "A 12-course blind tasting designed to heighten olfactory response.",
                  ),
                  SizedBox(height: 12.h),
                  
                  _buildExperienceCard(
                    icon: Icons.hearing,
                    title: "Acoustic Pairing",
                    desc: "Spatial audio landscape synchronized with the temperature of each dish.",
                  ),
                  SizedBox(height: 12.h),
                  
                  _buildExperienceCard(
                    icon: Icons.table_restaurant_outlined,
                    title: "Private Table",
                    desc: "Maximum of 4 guests per session to maintain absolute silence.",
                  ),
                  SizedBox(height: 32.h),
                  
                  CustomText(
                    text: "Details",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                  SizedBox(height: 16.h),
                  
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.location_on_outlined, color: AppColors.black, size: 20.sp),
                      SizedBox(width: 12.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: "Address",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.black,
                          ),
                          SizedBox(height: 4.h),
                          CustomText(
                            text: "42 Berkeley Square, Mayfair\nLondon W1J 5AW",
                            fontSize: 14.sp,
                            color: AppColors.greyShade,
                          ),
                        ],
                      ),
                    ],
                  ),
                  
                  SizedBox(height: 40.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExperienceCard({required IconData icon, required String title, required String desc}) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24.w),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppColors.black, size: 24.sp),
          SizedBox(height: 24.h),
          CustomText(
            text: title,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
          SizedBox(height: 8.h),
          CustomText(
            text: desc,
            fontSize: 12.sp,
            color: AppColors.greyShade,
          ),
        ],
      ),
    );
  }
}
