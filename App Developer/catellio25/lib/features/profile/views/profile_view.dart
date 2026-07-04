import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../../global_widgets/custom_text/custom_text.dart';
import '../../../../global_widgets/custom_royel_appbar/custom_royel_appbar.dart';
import '../../../../core/app_routes/app_routes.dart';
import '../view_models/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomRoyelAppbar(
        titleName: AppStrings.profile,
        titleColor: AppColors.black,
        actionWidget: CircleAvatar(
          radius: 16.r,
          backgroundImage: const NetworkImage("https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?q=80&w=200&auto=format&fit=crop"),
          backgroundColor: AppColors.greyShade.withOpacity(0.2),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        child: Column(
          children: [
            // Profile Header
            _buildProfileHeader(),
            SizedBox(height: 32.h),
            
            // Membership Card
            _buildMembershipCard(),
            SizedBox(height: 32.h),
            
            // Account Section
            Align(
              alignment: Alignment.centerLeft,
              child: CustomText(
                text: "Account",
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
            ),
            SizedBox(height: 16.h),
            _buildAccountMenu(),
            SizedBox(height: 16.h),
            
            // Sign Out Button
            _buildSignOutButton(context),
            
            SizedBox(height: 120.h), // Bottom nav padding
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Column(
      children: [
        Container(
          width: 100.w,
          height: 100.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.white, width: 4),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
            image: const DecorationImage(
              image: NetworkImage("https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?q=80&w=400&auto=format&fit=crop"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 16.h),
        CustomText(
          text: "Julian Thorne",
          fontSize: 28.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.black,
        ),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => Get.toNamed(AppRoutes.editProfileScreen),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(100.r),
                  border: Border.all(color: AppColors.greyShade.withOpacity(0.2)),
                ),
                child: Row(
                  children: [
                    Icon(Icons.edit, color: AppColors.greyShade, size: 14.sp),
                    SizedBox(width: 8.w),
                    CustomText(
                      text: "Edit Profile",
                      fontSize: 12.sp,
                      color: AppColors.greyShade,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: AppColors.black,
                borderRadius: BorderRadius.circular(100.r),
              ),
              child: Row(
                children: [
                  Icon(Icons.star, color: AppColors.white, size: 14.sp),
                  SizedBox(width: 8.w),
                  CustomText(
                    text: "ELITE MEMBER",
                    fontSize: 10.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMembershipCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF2F2F2F),
            Color(0xFF1A1A1A),
          ],
        ),
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 30,
            offset: const Offset(0, 15),
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
                text: "CURRENT TIER",
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.greyShade.withOpacity(0.8),
              ),
              Icon(Icons.gpp_good_outlined, color: AppColors.greyShade.withOpacity(0.8), size: 24.sp),
            ],
          ),
          SizedBox(height: 8.h),
          CustomText(
            text: "Elite Membership",
            fontSize: 26.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.white,
          ),
          SizedBox(height: 16.h),
          CustomText(
            text: "Next renewal: December 14, 2024",
            fontSize: 14.sp,
            color: AppColors.white.withOpacity(0.8),
          ),
          SizedBox(height: 24.h),
          GestureDetector(
            onTap: () => Get.toNamed(AppRoutes.subscriptionScreen),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 16.h),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Center(
                child: CustomText(
                  text: "Manage Membership",
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAccountMenu() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF9F9F9),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.greyShade.withOpacity(0.1)),
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Get.toNamed(AppRoutes.securitySettingsScreen),
            child: _buildMenuItem(Icons.lock_outline, "Security"),
          ),
          Divider(height: 1, color: AppColors.greyShade.withOpacity(0.1)),
          GestureDetector(
            onTap: () => Get.toNamed(AppRoutes.notificationSettingsScreen),
            child: _buildMenuItem(Icons.notifications_none, "Notifications"),
          ),
          Divider(height: 1, color: AppColors.greyShade.withOpacity(0.1)),
          GestureDetector(
            onTap: () => Get.toNamed(AppRoutes.privacyPolicyScreen),
            child: _buildMenuItem(Icons.privacy_tip_outlined, "Privacy Policy"),
          ),
          Divider(height: 1, color: AppColors.greyShade.withOpacity(0.1)),
          GestureDetector(
            onTap: () => Get.toNamed(AppRoutes.termsConditionsScreen),
            child: _buildMenuItem(Icons.description_outlined, "Terms & Conditions"),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Row(
        children: [
          Icon(icon, color: AppColors.black, size: 20.sp),
          SizedBox(width: 16.w),
          Expanded(
            child: CustomText(
              text: title,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
            ),
          ),
          Icon(Icons.chevron_right, color: AppColors.greyShade, size: 20.sp),
        ],
      ),
    );
  }

  Widget _buildSignOutButton(BuildContext context) {
    return GestureDetector(
      onTap: () => _showSignOutDialog(context),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 16.h),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: const Color(0xFFFFE5E5)),
        ),
        child: Center(
          child: CustomText(
            text: "Sign Out",
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: const Color(0xFFE53935),
          ),
        ),
      ),
    );
  }

  void _showSignOutDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.5),
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Container(
            padding: EdgeInsets.all(32.w),
            decoration: BoxDecoration(
              color: const Color(0xFFF9F9F9),
              borderRadius: BorderRadius.circular(24.r),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 56.w,
                  height: 56.w,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFBEAEA),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(Icons.logout, color: const Color(0xFFE53935), size: 24.sp),
                  ),
                ),
                SizedBox(height: 24.h),
                CustomText(
                  text: "Sign Out?",
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
                SizedBox(height: 12.h),
                CustomText(
                  text: "Are you sure you want to end your session with Alfred? Your curated itineraries remain safe.",
                  fontSize: 12.sp,
                  color: AppColors.greyShade,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 32.h),
                GestureDetector(
                  onTap: () {
                    Get.back(); // Close dialog
                    // Add actual sign out logic here, e.g. Get.offAllNamed('/sign_in')
                  },
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF9F9F9),
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(color: const Color(0xFFEAEAEA)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.02),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Center(
                      child: CustomText(
                        text: "Sign Out",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFFE53935),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF9F9F9),
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(color: const Color(0xFFEAEAEA)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.02),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Center(
                      child: CustomText(
                        text: "Cancel",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
