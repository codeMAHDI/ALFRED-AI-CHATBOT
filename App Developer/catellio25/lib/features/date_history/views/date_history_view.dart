import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../global_widgets/custom_text/custom_text.dart';
import '../../../../global_widgets/custom_drawer/custom_drawer.dart';
import '../../../../core/app_routes/app_routes.dart';
import '../view_models/date_history_view_model.dart';

class DateHistoryView extends GetView<DateHistoryViewModel> {
  DateHistoryView({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xFFFBFBFB),
      drawer: const CustomDrawer(currentRoute: AppRoutes.dateHistoryScreen),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFBFBFB),
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: GestureDetector(
          onTap: () => scaffoldKey.currentState?.openDrawer(),
          child: Icon(Icons.menu, color: AppColors.black, size: 24.sp),
        ),
        title: CustomText(
          text: "Date History",
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.black,
        ),
        centerTitle: false,
        titleSpacing: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Timeline line
              Container(
                width: 1.w,
                color: AppColors.greyShade.withOpacity(0.2),
                margin: EdgeInsets.only(left: 6.w, right: 24.w),
              ),
              // Timeline items
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHistoryItem(
                      date: "Nov 12, 2023",
                      image: "https://images.unsplash.com/photo-1514933651103-005eec06c04b?q=80&w=400&auto=format&fit=crop",
                      category: "FINE DINING",
                      title: "The Obsidian Room",
                    ),
                    SizedBox(height: 32.h),
                    _buildHistoryItem(
                      date: "Oct 28, 2023",
                      image: "https://images.unsplash.com/photo-1596701062351-8c2c14d1fdd0?q=80&w=400&auto=format&fit=crop",
                      category: "EXCLUSIVE TOUR",
                      title: "Vineyard Sunrise",
                    ),
                    SizedBox(height: 32.h),
                    _buildHistoryItem(
                      date: "Sep 15, 2023",
                      image: "https://images.unsplash.com/photo-1540555700478-4be289fbecef?q=80&w=400&auto=format&fit=crop",
                      category: "WELLNESS RETREAT",
                      title: "The Monolith",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHistoryItem({
    required String date,
    required String image,
    required String category,
    required String title,
  }) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // The dot on the timeline
        Positioned(
          left: -32.5.w,
          top: 8.h,
          child: Container(
            width: 6.w,
            height: 6.w,
            decoration: const BoxDecoration(
              color: AppColors.black,
              shape: BoxShape.circle,
            ),
          ),
        ),
        // Content
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: const Color(0xFFF0F0F0),
                borderRadius: BorderRadius.circular(100.r),
              ),
              child: CustomText(
                text: date,
                fontSize: 12.sp,
                color: const Color(0xFF666666),
              ),
            ),
            SizedBox(height: 16.h),
            Container(
              width: double.infinity,
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
                    child: Image.network(
                      image,
                      height: 120.h,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: category,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.greyShade,
                        ),
                        SizedBox(height: 6.h),
                        CustomText(
                          text: title,
                          fontSize: 16.sp,
                          color: AppColors.black,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
