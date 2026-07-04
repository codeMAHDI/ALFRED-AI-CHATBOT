import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../global_widgets/custom_text/custom_text.dart';
import '../../../../global_widgets/custom_royel_appbar/custom_royel_appbar.dart';
import '../view_models/notification_settings_controller.dart';

class NotificationSettingsView extends GetView<NotificationSettingsController> {
  const NotificationSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CustomRoyelAppbar(
        titleName: "Notifications",
        titleColor: AppColors.black,
        leftIcon: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Push Notifications Card
            Container(
              padding: EdgeInsets.all(24.w),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "Push Notifications",
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black,
                        ),
                        SizedBox(height: 8.h),
                        CustomText(
                          text: "Allow Alfred to send critical alerts and real-time updates",
                          fontSize: 12.sp,
                          color: AppColors.greyShade,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Obx(() => CupertinoSwitch(
                    value: controller.pushNotifications.value,
                    onChanged: controller.togglePushNotifications,
                    activeColor: AppColors.black,
                  )),
                ],
              ),
            ),
            
            SizedBox(height: 32.h),
            
            // Section Header
            CustomText(
              text: "ALERT PREFERENCES",
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.greyShade,
            ),
            SizedBox(height: 16.h),
            
            // Date Reminders Card
            Container(
              padding: EdgeInsets.all(24.w),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      color: AppColors.background,
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(color: AppColors.greyShade.withOpacity(0.2)),
                    ),
                    child: Icon(Icons.calendar_month_outlined, color: AppColors.black, size: 24.sp),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "Date Reminders",
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black,
                        ),
                        SizedBox(height: 4.h),
                        CustomText(
                          text: "Birthdays, anniversaries, and key milestones",
                          fontSize: 12.sp,
                          color: AppColors.greyShade,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Obx(() => CupertinoSwitch(
                    value: controller.dateReminders.value,
                    onChanged: controller.toggleDateReminders,
                    activeColor: AppColors.black,
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
