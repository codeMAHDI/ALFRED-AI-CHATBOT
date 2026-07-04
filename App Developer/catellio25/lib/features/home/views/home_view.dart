import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../utils/app_icons/app_icons.dart';
import '../../../../utils/app_images/app_images.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../../global_widgets/custom_text/custom_text.dart';
import '../../../../global_widgets/animated_sparking_orb/animated_sparking_orb.dart';
import '../view_models/home_controller.dart';
import '../../../../core/app_routes/app_routes.dart';
import '../../main_layout/view_models/main_layout_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 16.h, bottom: 120.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Greeting
            CustomText(
              text: AppStrings.goodEveningName,
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
            SizedBox(height: 8.h),
            CustomText(
              text: AppStrings.organizedSchedule,
              fontSize: 14.sp,
              color: AppColors.greyShade,
            ),
            SizedBox(height: 40.h),
            
            // Orb
            Center(
              child: AnimatedSparkingOrb(
                imagePath: AppImages.orbImage,
                width: 280.w,
                height: 280.w,
              ),
            ),
            SizedBox(height: 20.h),
            
            // ALFRED text below orb
            Center(
              child: Text(
                AppStrings.alfredTitle.toUpperCase(),
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 8.w,
                  color: AppColors.black,
                ),
              ),
            ),
            SizedBox(height: 40.h),

            // Search Bar
            GestureDetector(
              onTap: () => Get.toNamed(AppRoutes.alfredChatScreen),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(100.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.02),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomText(
                        text: AppStrings.askAlfred,
                        fontSize: 14.sp,
                        color: AppColors.greyShade,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Get.toNamed(AppRoutes.voiceListeningScreen),
                      child: Icon(Icons.mic_none, color: AppColors.black, size: 24.sp),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 40.h),

            // SUGGESTIONS
            CustomText(
              text: AppStrings.suggestions,
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.greyShade,
              // letterSpacing is not on CustomText, let's just use it normally
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Expanded(child: _buildSuggestionCard(AppStrings.planADate, Icons.favorite_border)),
                SizedBox(width: 16.w),
                Expanded(child: _buildSuggestionCard(AppStrings.dateIdeas, Icons.lightbulb_outline)),
              ],
            ),
            SizedBox(height: 40.h),

            // NEXT EVENT
            Container(
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: AppStrings.nextEvent,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.greyShade,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                        decoration: BoxDecoration(
                          color: AppColors.black,
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                        child: CustomText(
                          text: AppStrings.eliteTag,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  CustomText(
                    text: AppStrings.sampleEventTitle,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      Icon(Icons.access_time, color: AppColors.greyShade, size: 16.sp),
                      SizedBox(width: 6.w),
                      CustomText(
                        text: AppStrings.sampleEventTime,
                        fontSize: 12.sp,
                        color: AppColors.greyShade,
                      ),
                      SizedBox(width: 24.w),
                      SvgPicture.asset(
                        AppIcons.locationIcon,
                        width: 14.sp,
                        height: 14.sp,
                        colorFilter: const ColorFilter.mode(AppColors.greyShade, BlendMode.srcIn),
                      ),
                      SizedBox(width: 6.w),
                      CustomText(
                        text: AppStrings.sampleEventLocation,
                        fontSize: 12.sp,
                        color: AppColors.greyShade,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSuggestionCard(String title, IconData icon) {
    return GestureDetector(
      onTap: () => Get.toNamed(AppRoutes.alfredChatScreen),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.h),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: AppColors.greyShade, size: 18.sp),
            SizedBox(width: 8.w),
            CustomText(
              text: title,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.background,
      elevation: 0,
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          GestureDetector(
            onTap: () => Get.find<MainLayoutController>().scaffoldKey.currentState?.openDrawer(),
            child: Icon(Icons.menu, color: AppColors.black, size: 28.sp),
          ),
          SizedBox(width: 16.w),
          GestureDetector(
            onTap: () => Get.toNamed(AppRoutes.subscriptionScreen),
            child: SvgPicture.asset(
              AppIcons.luxuryIcon,
              width: 24.sp,
              height: 24.sp,
              colorFilter: const ColorFilter.mode(AppColors.black, BlendMode.srcIn),
            ),
          ),
        ],
      ),
      centerTitle: true,
      // The "Alfred" title is in the center
      flexibleSpace: SafeArea(
        child: Center(
          child: CustomText(
            text: AppStrings.alfredTitle,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () => Get.toNamed(AppRoutes.notificationsScreen),
          child: Icon(Icons.notifications_none, color: AppColors.black, size: 28.sp),
        ),
        SizedBox(width: 16.w),
        CircleAvatar(
          radius: 16.r,
          backgroundColor: AppColors.greyShade.withOpacity(0.2),
          child: Icon(Icons.person, color: AppColors.greyShade, size: 20.sp),
        ),
        SizedBox(width: 24.w),
      ],
    );
  }
}
