import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../global_widgets/custom_text/custom_text.dart';
import '../../../../global_widgets/custom_royel_appbar/custom_royel_appbar.dart';
import '../view_models/profile_controller.dart';

class TermsConditionsScreen extends GetView<ProfileController> {
  const TermsConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CustomRoyelAppbar(
        titleName: "Terms & Conditions",
        titleColor: AppColors.black,
        leftIcon: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: "Welcome to Catellio",
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
            SizedBox(height: 8.h),
            CustomText(
              text: "Last Updated: October 2024",
              fontSize: 12.sp,
              color: AppColors.greyShade,
            ),
            SizedBox(height: 24.h),
            CustomText(
              text: "By accessing or using the Catellio application and its services, you agree to be bound by these Terms and Conditions. Please read them carefully.",
              fontSize: 14.sp,
              color: AppColors.greyShade,
            ),
            SizedBox(height: 32.h),
            
            _buildSection(
              title: "1. Acceptance of Terms",
              content: "By creating an account, accessing, or using Catellio, you signify your agreement to these Terms. If you do not agree to these Terms, you may not access or use the application.",
            ),
            
            _buildSection(
              title: "2. User Obligations",
              content: "You agree to use Catellio only for lawful purposes. You must not use the application in any way that causes, or may cause, damage to the application or impairment of the availability or accessibility of the service.",
            ),
            
            _buildSection(
              title: "3. Memberships & Subscriptions",
              content: "Catellio offers premium membership tiers. By subscribing, you agree to pay all applicable fees and taxes. Memberships automatically renew unless canceled before the renewal date.",
            ),
            
            _buildSection(
              title: "4. Intellectual Property",
              content: "All content, features, and functionality of Catellio, including but not limited to the Alfred AI architecture, design, and graphics, are owned by Catellio and are protected by international copyright and intellectual property laws.",
            ),
            
            SizedBox(height: 20.h),
            
            // A nice "Accept" style footer
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(24.w),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(color: AppColors.greyShade.withOpacity(0.1)),
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
                  CustomText(
                    text: "By continuing to use Catellio, you acknowledge that you have read and understood our terms.",
                    fontSize: 12.sp,
                    color: AppColors.greyShade,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16.h),
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 14.h),
                      decoration: BoxDecoration(
                        color: AppColors.black,
                        borderRadius: BorderRadius.circular(100.r),
                      ),
                      child: Center(
                        child: CustomText(
                          text: "I Understand",
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({required String title, required String content}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: title,
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
          SizedBox(height: 12.h),
          CustomText(
            text: content,
            fontSize: 14.sp,
            color: AppColors.greyShade,
          ),
        ],
      ),
    );
  }
}
