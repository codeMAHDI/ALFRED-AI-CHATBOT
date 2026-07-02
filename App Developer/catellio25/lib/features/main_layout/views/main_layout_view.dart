import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../utils/app_icons/app_icons.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../../global_widgets/custom_text/custom_text.dart';
import '../view_models/main_layout_view_model.dart';
import '../../home/views/home_view.dart';

class MainLayoutView extends GetView<MainLayoutViewModel> {
  const MainLayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // Content
          Obx(() => IndexedStack(
            index: controller.selectedIndex.value,
            children: [
               HomeView(), // 0: Home
              _buildPlaceholder(AppStrings.plans), // 1: Plans
              _buildPlaceholder(AppStrings.discovery), // 2: Discovery
              _buildPlaceholder(AppStrings.calender), // 3: Calender
              _buildPlaceholder(AppStrings.profile), // 4: Profile
            ],
          )),
          
          // Floating Bottom Nav Bar
          Align(
            alignment: Alignment.bottomCenter,
            child: _buildFloatingNavBar(),
          ),
        ],
      ),
    );
  }

  Widget _buildPlaceholder(String title) {
    return Center(
      child: CustomText(
        text: title,
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.greyShade,
      ),
    );
  }

  Widget _buildFloatingNavBar() {
    return Container(
      margin: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 24.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(100.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildNavItem(0, AppIcons.homeIcon, AppStrings.home),
          _buildNavItem(1, AppIcons.plansIcon, AppStrings.plans),
          _buildNavItem(2, AppIcons.discoveryIcon, AppStrings.discovery),
          _buildNavItem(3, AppIcons.calenderIcon, AppStrings.calender),
          _buildNavItem(4, AppIcons.profileIcon, AppStrings.profile),
        ],
      ),
    );
  }

  Widget _buildNavItem(int index, String iconPath, String label) {
    return GestureDetector(
      onTap: () => controller.changeTab(index),
      behavior: HitTestBehavior.opaque,
      child: Obx(() {
        final isSelected = controller.selectedIndex.value == index;
        final color = isSelected ? AppColors.black : AppColors.greyShade.withOpacity(0.5);
        
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              iconPath,
              width: 24.sp,
              height: 24.sp,
              colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
            ),
            SizedBox(height: 4.h),
            CustomText(
              text: label,
              fontSize: 10.sp,
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
              color: color,
            ),
          ],
        );
      }),
    );
  }
}
