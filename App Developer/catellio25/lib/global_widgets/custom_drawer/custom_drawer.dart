import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../core/theme/app_colors.dart';
import '../../utils/app_icons/app_icons.dart';
import '../../utils/app_strings/app_strings.dart';
import '../custom_text/custom_text.dart';
import '../../core/app_routes/app_routes.dart';
import '../../features/main_layout/view_models/main_layout_view_model.dart';

class CustomDrawer extends StatelessWidget {
  final String currentRoute;

  const CustomDrawer({super.key, required this.currentRoute});

  void _navigateTo(String route) {
    Get.back(); // Close drawer first
    if (currentRoute == route) {
      if (route == AppRoutes.mainLayoutScreen && Get.isRegistered<MainLayoutViewModel>()) {
        Get.find<MainLayoutViewModel>().changeTab(0);
      }
      return; 
    }

    if (route == AppRoutes.mainLayoutScreen) {
      Get.until((r) => r.settings.name == AppRoutes.mainLayoutScreen);
      if (Get.isRegistered<MainLayoutViewModel>()) {
        Get.find<MainLayoutViewModel>().changeTab(0);
      }
    } else {
      if (currentRoute == AppRoutes.mainLayoutScreen) {
        Get.toNamed(route);
      } else {
        Get.offNamed(route);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.white,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(24.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Icon(Icons.close, color: AppColors.black, size: 24.sp),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 64.w,
                    height: 64.w,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage("https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?q=80&w=400&auto=format&fit=crop"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  CustomText(
                    text: AppStrings.julianThorne,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Icon(Icons.stars, color: AppColors.black, size: 14.sp),
                      SizedBox(width: 6.w),
                      CustomText(
                        text: AppStrings.eliteMember,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.greyShade,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 40.h),
            _buildDrawerItem(
              iconPath: AppIcons.homeIcon,
              title: AppStrings.home,
              isSelected: currentRoute == AppRoutes.mainLayoutScreen,
              onTap: () => _navigateTo(AppRoutes.mainLayoutScreen),
            ),
            _buildDrawerItem(
              iconPath: AppIcons.historyIcon,
              title: AppStrings.dateHistory,
              isSelected: currentRoute == AppRoutes.dateHistoryScreen,
              onTap: () => _navigateTo(AppRoutes.dateHistoryScreen),
            ),
            _buildDrawerItem(
              iconPath: AppIcons.saveIcon,
              title: AppStrings.savedItems,
              isSelected: currentRoute == AppRoutes.savedItemsScreen,
              onTap: () => _navigateTo(AppRoutes.savedItemsScreen),
            ),
            _buildDrawerItem(
              iconPath: AppIcons.voiceIcon,
              title: AppStrings.premiumVoiceStore,
              isSelected: currentRoute == AppRoutes.premiumVoiceStoreScreen,
              onTap: () => _navigateTo(AppRoutes.premiumVoiceStoreScreen),
            ),
            _buildDrawerItem(
              iconPath: AppIcons.budgetIcon,
              title: AppStrings.budgetInsights,
              isSelected: currentRoute == AppRoutes.budgetInsightsScreen,
              onTap: () => _navigateTo(AppRoutes.budgetInsightsScreen),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem({
    required String iconPath,
    required String title,
    required bool isSelected,
    VoidCallback? onTap,
  }) {
    final bgColor = isSelected ? AppColors.black : const Color(0xFFF9F9F9);
    final iconColor = isSelected ? AppColors.white : AppColors.black;
    final textColor = isSelected ? AppColors.black : AppColors.black;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: SvgPicture.asset(
                iconPath,
                width: 20.sp,
                height: 20.sp,
                colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
              ),
            ),
            SizedBox(width: 16.w),
            CustomText(
              text: title,
              fontSize: 16.sp,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              color: textColor,
            ),
          ],
        ),
      ),
    );
  }
}
