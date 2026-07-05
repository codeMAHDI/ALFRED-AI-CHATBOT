import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../global_widgets/custom_text/custom_text.dart';
import '../../../../global_widgets/custom_royel_appbar/custom_royel_appbar.dart';
import '../view_models/profile_controller.dart';

class PrivacyPolicyScreen extends GetView<ProfileController> {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CustomRoyelAppbar(
        titleName: "Privacy Policy",
        titleColor: AppColors.black,
        leftIcon: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: "Your Privacy is our Priority",
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
            SizedBox(height: 16.h),
            CustomText(
              text: "At Catellio, we are committed to protecting your privacy and ensuring the security of your personal data. This policy explains how we collect, use, and safeguard your information.",
              fontSize: 14.sp,
              maxLines: 10,
              color: AppColors.greyShade,
            ),
            SizedBox(height: 32.h),
            
            _buildSection(
              title: "1. Information We Collect",
              content: "We collect information you provide directly to us when you create an account, update your profile, use the Alfred AI assistant, or communicate with us. This includes your name, email address, preferences, and interaction history.",
            ),
            
            _buildSection(
              title: "2. How We Use Your Information",
              content: "We use the information we collect to provide, maintain, and improve our services. This includes personalizing your experience, providing tailored recommendations via Alfred, processing transactions, and sending you technical notices.",
            ),
            
            _buildSection(
              title: "3. Data Security",
              content: "We implement rigorous security measures to protect your personal information from unauthorized access, alteration, disclosure, or destruction. We utilize industry-standard encryption protocols.",
            ),
            
            _buildSection(
              title: "4. Sharing of Information",
              content: "We do not sell your personal information. We may share your data with trusted third-party service providers only as necessary to provide our services and operate our business, under strict confidentiality agreements.",
            ),
            
            SizedBox(height: 40.h),
            
            Center(
              child: Container(
                padding: EdgeInsets.all(24.w),
                decoration: BoxDecoration(
                  color: const Color(0xFFF4F3ED),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Column(
                  children: [
                    Icon(Icons.shield_outlined, color: AppColors.black, size: 32.sp),
                    SizedBox(height: 16.h),
                    CustomText(
                      text: "Have questions about your privacy?",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8.h),
                    CustomText(
                      text: "Contact our Data Protection Officer at privacy@catellio.com",
                      fontSize: 12.sp,
                      color: AppColors.greyShade,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
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
            maxLines: 10,
            color: AppColors.greyShade,
          ),
        ],
      ),
    );
  }
}
