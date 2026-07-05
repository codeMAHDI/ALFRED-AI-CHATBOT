import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../../global_widgets/custom_text/custom_text.dart';
import '../../../../global_widgets/custom_royel_appbar/custom_royel_appbar.dart';
import '../../../../core/app_routes/app_routes.dart';
import '../../../../utils/app_icons/app_icons.dart';
import '../view_models/plans_controller.dart';

class CalendarScreen extends GetView<PlansController> {
  final bool isStandalone;
  
  const CalendarScreen({super.key, this.isStandalone = true});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomRoyelAppbar(
        titleName: AppStrings.calender, 
        leftIcon: isStandalone, // Only show back button if standalone
        titleColor: AppColors.black,
        actionWidget: CircleAvatar(
          radius: 16.r,
          backgroundColor: AppColors.greyShade.withOpacity(0.2),
          child: Icon(Icons.person, color: AppColors.greyShade, size: 20.sp),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildCalendarWidget(),
                SizedBox(height: 32.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: "Today's Events",
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                    CustomText(
                      text: "Saturday, Oct 12",
                      fontSize: 12.sp,
                      color: AppColors.greyShade,
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                _buildEventCard("08:00 AM", "Executive Briefing"),
                SizedBox(height: 12.h),
                _buildEventCard("01:30 PM", "Art Acquisition Preview"),
                SizedBox(height: 12.h),
                _buildEventCard("08:00 PM", "Anniversary Dinner at The Glass House"),
                
                SizedBox(height: 32.h),
                CustomText(
                  text: "Alfred's Suggestions",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
                SizedBox(height: 16.h),
                _buildSuggestionCard(),
                if (isStandalone) SizedBox(height: 120.h) else SizedBox(height: 120.h), // Keep padding so real bottom nav doesn't overlap
              ],
            ),
          ),
          if (isStandalone)
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
      onTap: () {
        if (index != 3) {
          Get.offAllNamed(AppRoutes.homeScreen, arguments: {'tab': index});
        }
      },
      behavior: HitTestBehavior.opaque,
      child: Builder(builder: (context) {
        final isSelected = index == 3; // Hardcode Calendar tab as selected
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

  Widget _buildCalendarWidget() {
    return Container(
      padding: EdgeInsets.all(24.w),
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
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: "October 2024",
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
              Row(
                children: [
                  Icon(Icons.chevron_left, color: AppColors.greyShade.withOpacity(0.5), size: 20.sp),
                  SizedBox(width: 16.w),
                  Icon(Icons.chevron_right, color: AppColors.greyShade.withOpacity(0.5), size: 20.sp),
                ],
              ),
            ],
          ),
          SizedBox(height: 24.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: ["M", "T", "W", "T", "F", "S", "S"].map((day) {
              return SizedBox(
                width: 32.w,
                child: Center(
                  child: CustomText(
                    text: day,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.greyShade.withOpacity(0.5),
                  ),
                ),
              );
            }).toList(),
          ),
          SizedBox(height: 16.h),
          _buildCalendarRow(["30", "1", "2.", "3", "4", "5", "6"], isFirstRow: true),
          SizedBox(height: 16.h),
          _buildCalendarRow(["7", "8", "9", "10.", "11", "12*", "13"]),
          SizedBox(height: 16.h),
          _buildCalendarRow(["14", "15.", "16", "17", "18", "19", "20"]),
        ],
      ),
    );
  }

  Widget _buildCalendarRow(List<String> days, {bool isFirstRow = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: days.map((dayStr) {
        bool isFaded = isFirstRow && dayStr == "30";
        bool isSelected = dayStr.contains("*");
        bool hasDot = dayStr.contains(".");
        String cleanDay = dayStr.replaceAll("*", "").replaceAll(".", "");
        
        return SizedBox(
          width: 32.w,
          height: 32.w,
          child: Stack(
            alignment: Alignment.center,
            children: [
              if (isSelected)
                Container(
                  decoration: const BoxDecoration(
                    color: AppColors.black,
                    shape: BoxShape.circle,
                  ),
                ),
              CustomText(
                text: cleanDay,
                fontSize: 14.sp,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                color: isSelected 
                    ? AppColors.white 
                    : isFaded ? AppColors.greyShade.withOpacity(0.3) : AppColors.black,
              ),
              if (hasDot)
                Positioned(
                  bottom: 2.h,
                  child: Container(
                    width: 4.w,
                    height: 4.w,
                    decoration: const BoxDecoration(
                      color: AppColors.black,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildEventCard(String time, String title) {
    return Container(
      width: double.infinity,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: time,
            fontSize: 10.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.greyShade,
          ),
          SizedBox(height: 8.h),
          CustomText(
            text: title,
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
        ],
      ),
    );
  }

  Widget _buildSuggestionCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF404040),
            Color(0xFF2A2A2A),
          ],
        ),
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.auto_awesome, color: AppColors.white.withOpacity(0.5), size: 14.sp),
              SizedBox(width: 8.w),
              CustomText(
                text: "INTELLIGENCE",
                fontSize: 10.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.white.withOpacity(0.5),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          CustomText(
            text: "Friday night is open. Would you like a curated Jazz evening at The Blue Room?",
            fontSize: 16.sp,
            color: AppColors.white.withOpacity(0.9),
          ),
          SizedBox(height: 24.h),
          Row(
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(100.r),
                  ),
                  child: Center(
                    child: CustomText(
                      text: "Yes, arrange this",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(100.r),
                    border: Border.all(color: AppColors.white.withOpacity(0.2)),
                  ),
                  child: Center(
                    child: CustomText(
                      text: "Dismiss",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
