import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../../global_widgets/custom_text/custom_text.dart';
import '../../../../global_widgets/custom_royel_appbar/custom_royel_appbar.dart';
import '../widgets/profile_widgets.dart';
import '../view_models/profile_controller.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomRoyelAppbar(
        titleName: AppStrings.profile,
        titleColor: AppColors.black,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        child: Column(
          children: [
            // Profile Header
            ProfileWidgets.buildProfileHeader(),
            SizedBox(height: 32.h),
            
            // Membership Card
            ProfileWidgets.buildMembershipCard(),
            SizedBox(height: 32.h),
            
            // Account Section
            Align(
              alignment: Alignment.centerLeft,
              child: CustomText(
                text: "Account",
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
            ),
            SizedBox(height: 16.h),
            ProfileWidgets.buildAccountMenu(),
            SizedBox(height: 16.h),
            
            // Sign Out Button
            ProfileWidgets.buildSignOutButton(context),
            
            SizedBox(height: 120.h),
          ],
        ),
      ),
    );
  }

}
