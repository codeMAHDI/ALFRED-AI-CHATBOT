import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../../global_widgets/custom_text/custom_text.dart';
import '../../../../global_widgets/custom_royel_appbar/custom_royel_appbar.dart';
import '../view_models/notifications_view_model.dart';

class NotificationsView extends GetView<NotificationsViewModel> {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CustomRoyelAppbar(
        titleName: AppStrings.notifications,
        leftIcon: true,
        titleColor: AppColors.black,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.only(top: 24.h, bottom: 40.h, right: 60.w),
                    child: CustomText(
                      text: AppStrings.curatedUpdates,
                      fontSize: 14.sp,
                      color: AppColors.greyShade,
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    width: 60.w,
                    height: 60.w,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        AppStrings.markAllAsRead,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 8.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.greyShade,
                          height: 1.2,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            
            CustomText(
              text: AppStrings.newUpdates,
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
            SizedBox(height: 16.h),
            
            _buildNotificationCard(
              icon: Icons.calendar_today_outlined,
              title: "Reminder: Dinner with Lisa\ntomorrow at 7:00 PM",
              time: "2m ago",
              isUnread: true,
            ),
            SizedBox(height: 12.h),
            _buildNotificationCard(
              icon: Icons.auto_awesome,
              title: "Alfred found a new\nromantic restaurant nearby",
              time: "1h ago",
              isUnread: true,
            ),
            
            SizedBox(height: 40.h),
            
            CustomText(
              text: AppStrings.earlierUpdates,
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.greyShade,
            ),
            SizedBox(height: 16.h),
            
            _buildNotificationCard(
              icon: Icons.sync,
              title: "Your saved date plan has been\nupdated",
              time: "Yesterday",
              isUnread: false,
            ),
            SizedBox(height: 12.h),
            _buildNotificationCard(
              icon: Icons.person_outline,
              title: "Profile verification complete.\nWelcome to the inner circle.",
              time: "2 days ago",
              isUnread: false,
            ),
            
            SizedBox(height: 60.h),
            
            Center(
              child: Column(
                children: [
                  Container(
                    width: 80.w,
                    height: 80.w,
                    decoration: BoxDecoration(
                      color: AppColors.white_50,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.notifications_off_outlined,
                        color: AppColors.greyShade,
                        size: 32.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  CustomText(
                    text: AppStrings.endOfUpdates,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.greyShade,

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

  Widget _buildNotificationCard({
    required IconData icon,
    required String title,
    required String time,
    required bool isUnread,
  }) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppColors.black, size: 24.sp),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: title,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                  maxLines: 2,
                ),
                SizedBox(height: 8.h),
                CustomText(
                  text: time,
                  fontSize: 12.sp,
                  color: AppColors.greyShade,
                ),
              ],
            ),
          ),
          if (isUnread) ...[
            SizedBox(width: 12.w),
            Container(
              width: 8.w,
              height: 8.w,
              margin: EdgeInsets.only(top: 6.h),
              decoration: const BoxDecoration(
                color: AppColors.black,
                shape: BoxShape.circle,
              ),
            ),
          ]
        ],
      ),
    );
  }
}
