import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../global_widgets/custom_text/custom_text.dart';
import '../../../../global_widgets/custom_text_field/custom_text_field.dart';
import '../../../../global_widgets/custom_royel_appbar/custom_royel_appbar.dart';
import '../view_models/edit_profile_controller.dart';

class EditProfileScreen extends GetView<EditProfileController> {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CustomRoyelAppbar(
        titleName: "Edit Profile",
        titleColor: AppColors.black,
        leftIcon: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        width: 122.w,
                        height: 122.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.white, width: 4),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                          image: const DecorationImage(
                            image: NetworkImage("https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?q=80&w=400&auto=format&fit=crop"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(6.w),
                        decoration: const BoxDecoration(
                          color: AppColors.black,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.camera_alt_outlined, color: AppColors.white, size: 16.sp),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  CustomText(
                    text: "Julian Thorne",
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                  SizedBox(height: 4.h),
                  CustomText(
                    text: "Private Member since 2021",
                    fontSize: 12.sp,
                    color: AppColors.greyShade,
                  ),
                ],
              ),
            ),
            SizedBox(height: 40.h),
            
            // Form Fields
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "Full Name",
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
                SizedBox(height: 8.h),
                CustomTextField(
                  hintStyle: TextStyle(fontSize: 16.h, fontWeight: FontWeight.w400),
                  hintText: "Julian Thorne",
                  fillColor: AppColors.white,
                  fieldBorderColor: const Color(0xFFF0F0F0),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "Email Address",
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
                SizedBox(height: 8.h),
                CustomTextField(
                  hintStyle: TextStyle(fontSize: 16.h, fontWeight: FontWeight.w400),
                  hintText: "julian.thorne@lifestyle.com",
                  fillColor: AppColors.white,
                  fieldBorderColor: const Color(0xFFF0F0F0),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "Age",
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                      SizedBox(height: 8.h),
                      CustomTextField(
                        hintStyle: TextStyle(fontSize: 16.h, fontWeight: FontWeight.w400),
                        hintText: "38",
                        fillColor: AppColors.white,
                        fieldBorderColor: const Color(0xFFF0F0F0),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "Gender",
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                      SizedBox(height: 8.h),
                      CustomTextField(
                        hintText: "Male",
                        hintStyle: TextStyle(fontSize: 16.h, fontWeight: FontWeight.w400),
                        fillColor: AppColors.white,
                        fieldBorderColor: const Color(0xFFF0F0F0),
                        readOnly: true,
                        suffixIcon: Icon(Icons.keyboard_arrow_down, color: AppColors.greyShade, size: 20.sp),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "Location",
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
                SizedBox(height: 8.h),
                CustomTextField(
                  hintText: "London, UK",
                  hintStyle: TextStyle(fontSize: 16.h, fontWeight: FontWeight.w400),
                  fillColor: AppColors.white,
                  fieldBorderColor: const Color(0xFFF0F0F0),
                  prefixIcon: Icon(Icons.location_on_outlined, color: AppColors.greyShade, size: 20.sp),
                ),
              ],
            ),
            
            SizedBox(height: 40.h),
            
            // Save Button
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 18.h),
              decoration: BoxDecoration(
                color: AppColors.black,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Center(
                child: CustomText(
                  text: "Save Changes",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),
            ),
            
            SizedBox(height: 24.h),
            
            // Footer text
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: CustomText(
                text: "Updating your profile will sync across all your Alfred-connected devices instantly.",
                fontSize: 12.sp,
                color: AppColors.greyShade,
                textAlign: TextAlign.center,
              ),
            ),
            
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }

}
