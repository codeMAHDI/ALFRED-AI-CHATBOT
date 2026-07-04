import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../utils/app_icons/app_icons.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../../global_widgets/custom_text/custom_text.dart';
import '../view_models/main_layout_controller.dart';
import '../widgets/home_tab.dart';
import '../../plans/views/plans_screen.dart';
import '../../calendar/views/calendar_screen.dart';
import '../../discovery/views/discovery_screen.dart';
import '../../profile/views/profile_screen.dart';
import '../../../../core/app_routes/app_routes.dart';
import '../../../../global_widgets/custom_drawer/custom_drawer.dart';

class HomeScreen extends GetView<MainLayoutController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      backgroundColor: AppColors.background,
      drawer: const CustomDrawer(currentRoute: AppRoutes.homeScreen),
      body: Stack(
        children: [
          // Content
          Obx(() => IndexedStack(
            index: controller.selectedIndex.value,
            children: [
               HomeTab(), // 0: Home
              const PlansScreen(), // 1: Plans
              const DiscoveryScreen(), // 2: Discovery
              const CalendarScreen(isStandalone: false), // 3: Calender
              const ProfileScreen(), // 4: Profile
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
