import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../utils/app_icons/app_icons.dart';
import '../../../../global_widgets/custom_text/custom_text.dart';
import '../../../../global_widgets/custom_drawer/custom_drawer.dart';
import '../../../../core/app_routes/app_routes.dart';
import '../view_models/premium_voice_store_controller.dart';

class PremiumVoiceStoreView extends GetView<PremiumVoiceStoreController> {
  PremiumVoiceStoreView({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xFFFBFBFB),
      drawer: const CustomDrawer(currentRoute: AppRoutes.premiumVoiceStoreScreen),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFBFBFB),
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: GestureDetector(
          onTap: () => scaffoldKey.currentState?.openDrawer(),
          child: Icon(Icons.menu, color: AppColors.black, size: 24.sp),
        ),
        title: CustomText(
          text: "Voice Store",
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.black,
        ),
        centerTitle: false,
        titleSpacing: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: "Voice Personalization",
              fontSize: 28.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
            SizedBox(height: 8.h),
            CustomText(
              text: "Select a signature voice for your personal concierge.",
              fontSize: 14.sp,
              color: AppColors.greyShade,
            ),
            SizedBox(height: 32.h),

            _buildVoiceCard(
              tag: "Active",
              isActive: true,
              iconPath: AppIcons.voiceWaveIcon,
              title: "Default Alfred",
              description: "Balanced, sophisticated, and attentive. The original experience designed for seamless daily management.",
            ),
            SizedBox(height: 24.h),

            _buildVoiceCard(
              tag: "Premium",
              isActive: false,
              iconPath: AppIcons.premiumVoiceIcon,
              title: "Professional",
              description: "Precise, formal, and highly efficient. Optimized for high-stakes business coordination and brief updates.",
            ),
            SizedBox(height: 24.h),

            _buildVoiceCard(
              tag: "Bespoke",
              isActive: false,
              iconPath: AppIcons.executiveVoiceIcon,
              title: "Executive",
              description: "Authoritative, commanding, yet refined. For those who require a voice that reflects leadership and poise.",
            ),
            SizedBox(height: 24.h),

            _buildVoiceCard(
              tag: "Elegant",
              isActive: false,
              iconPath: AppIcons.elegantVoiceIcon,
              title: "Romantic",
              description: "Soft, warm, and eloquently spoken. A gentle companion for relaxed evening planning and poetry readbacks.",
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }

  Widget _buildVoiceCard({
    required String tag,
    required bool isActive,
    required String iconPath,
    required String title,
    required String description,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: isActive ? AppColors.black : AppColors.white,
                  borderRadius: BorderRadius.circular(100.r),
                  border: isActive ? null : Border.all(color: const Color(0xFFEEEEEE)),
                  boxShadow: isActive ? null : [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.02),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: CustomText(
                  text: tag,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.bold,
                  color: isActive ? AppColors.white : AppColors.black,
                ),
              ),
              SvgPicture.asset(
                iconPath,
                width: 24.sp,
                height: 24.sp,
                colorFilter: const ColorFilter.mode(AppColors.black, BlendMode.srcIn),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          CustomText(
            text: title,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
          SizedBox(height: 12.h),
          CustomText(
            text: description,
            fontSize: 14.sp,
            color: AppColors.greyShade,
          ),
          SizedBox(height: 24.h),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 48.h,
                  decoration: BoxDecoration(
                    color: isActive ? AppColors.black : const Color(0xFFF3F3F3),
                    borderRadius: BorderRadius.circular(100.r),
                  ),
                  child: Center(
                    child: CustomText(
                      text: isActive ? "Applied" : "Select Voice",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: isActive ? AppColors.white : AppColors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              Container(
                height: 48.h,
                width: 48.h,
                decoration: const BoxDecoration(
                  color: Color(0xFFF3F3F3),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    AppIcons.playIcon,
                    width: 16.sp,
                    height: 16.sp,
                    colorFilter: const ColorFilter.mode(AppColors.black, BlendMode.srcIn),
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
