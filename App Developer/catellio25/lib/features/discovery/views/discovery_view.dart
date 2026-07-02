import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../../global_widgets/custom_text/custom_text.dart';
import '../../../../global_widgets/custom_royel_appbar/custom_royel_appbar.dart';
import '../../../../core/app_routes/app_routes.dart';
import '../view_models/discovery_view_model.dart';

class DiscoveryView extends GetView<DiscoveryViewModel> {
  const DiscoveryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomRoyelAppbar(
        titleName: "Discover",
        titleColor: AppColors.black,
        actionWidget: CircleAvatar(
          radius: 16.r,
          backgroundColor: AppColors.greyShade.withOpacity(0.2),
          child: Icon(Icons.person, color: AppColors.greyShade, size: 20.sp),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        child: Column(
          children: [
            // Search Bar
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(100.r),
                border: Border.all(color: AppColors.greyShade.withOpacity(0.2)),
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: AppColors.greyShade, size: 20.sp),
                  SizedBox(width: 12.w),
                  CustomText(
                    text: "How can I assist your discovery today?",
                    fontSize: 14.sp,
                    color: AppColors.greyShade,
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),
            
            // Tabs
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildTab("Restaurants", isActive: true),
                _buildTab("Activities"),
                _buildTab("Events"),
                _buildTab("Travel"),
              ],
            ),
            SizedBox(height: 24.h),
            
            // Cards
            _buildDiscoveryCard(
              title: "The Obsidian Room",
              tag: "FINE DINING",
              desc: "An immersive culinary journey in total darkness, curated by Chef Elena Roux.",
              imageUrl: "https://images.unsplash.com/photo-1514933651103-005eec06c04b?q=80&w=600&auto=format&fit=crop",
              onTap: () => Get.toNamed(AppRoutes.discoveryDetailsScreen),
            ),
            SizedBox(height: 16.h),
            
            _buildDiscoveryCard(
              title: "Vineyard Tour",
              tag: "EXCLUSIVE",
              desc: "Sunrise tasting and aerial tour of the private estate.",
              imageUrl: "https://images.unsplash.com/photo-1605330364949-a65c957827bd?q=80&w=600&auto=format&fit=crop",
            ),
            SizedBox(height: 16.h),
            
            _buildDiscoveryCard(
              title: "The Monolith",
              tag: "WELLNESS",
              desc: "Architectural relaxation with bespoke sensory treatments.",
              imageUrl: "https://images.unsplash.com/photo-1540555700478-4be289fbecef?q=80&w=600&auto=format&fit=crop",
            ),
            SizedBox(height: 16.h),
            
            _buildDiscoveryCard(
              title: "Velvet & Glass Gala",
              tag: "INVITE ONLY",
              desc: "An evening of digital art and chamber music above the city clouds.",
              imageUrl: "https://images.unsplash.com/photo-1561489401-d28f09919f96?q=80&w=600&auto=format&fit=crop",
            ),
            
            SizedBox(height: 120.h), // Bottom nav padding
          ],
        ),
      ),
    );
  }

  Widget _buildTab(String title, {bool isActive = false}) {
    return Column(
      children: [
        CustomText(
          text: title,
          fontSize: 14.sp,
          fontWeight: isActive ? FontWeight.bold : FontWeight.w600,
          color: isActive ? AppColors.black : AppColors.greyShade.withOpacity(0.5),
        ),
        if (isActive) ...[
          SizedBox(height: 4.h),
          Container(
            width: 40.w,
            height: 2.h,
            color: AppColors.black,
          ),
        ]
      ],
    );
  }

  Widget _buildDiscoveryCard({
    required String title,
    required String tag,
    required String desc,
    required String imageUrl,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(24.r),
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
              borderRadius: BorderRadius.circular(16.r),
              child: Image.network(
                imageUrl,
                width: double.infinity,
                height: 160.h,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  width: double.infinity,
                  height: 160.h,
                  color: AppColors.greyShade.withOpacity(0.2),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: CustomText(
                    text: title,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF4F3ED),
                    borderRadius: BorderRadius.circular(100.r),
                  ),
                  child: CustomText(
                    text: tag,
                    fontSize: 8.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            CustomText(
              text: desc,
              fontSize: 12.sp,
              color: AppColors.greyShade,
            ),
          ],
        ),
      ),
    );
  }
}
