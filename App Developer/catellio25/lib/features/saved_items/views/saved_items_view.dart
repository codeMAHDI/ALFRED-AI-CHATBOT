import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../global_widgets/custom_text/custom_text.dart';
import '../../../../global_widgets/custom_drawer/custom_drawer.dart';
import '../../../../core/app_routes/app_routes.dart';
import '../view_models/saved_items_controller.dart';

class SavedItemsView extends GetView<SavedItemsController> {
  SavedItemsView({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xFFFBFBFB),
      drawer: const CustomDrawer(currentRoute: AppRoutes.savedItemsScreen),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFBFBFB),
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: GestureDetector(
          onTap: () => scaffoldKey.currentState?.openDrawer(),
          child: Icon(Icons.menu, color: AppColors.black, size: 24.sp),
        ),
        title: CustomText(
          text: "Saved Items",
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
              text: "Saved Plans",
              fontSize: 28.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
            SizedBox(height: 8.h),
            CustomText(
              text: "Your curated collection of premium experiences.",
              fontSize: 14.sp,
              color: AppColors.greyShade,
            ),
            SizedBox(height: 32.h),
            
            _buildSavedCard(
              image: "https://images.unsplash.com/photo-1545239351-ef35f43d514b?q=80&w=400&auto=format&fit=crop",
              title: "Coffee & Nature Walk",
              duration: "90 MIN",
              description: "A morning sequence through the botanical gardens followed by a...",
            ),
            SizedBox(height: 24.h),
            
            _buildSavedCard(
              image: "https://images.unsplash.com/photo-1510798831971-661eb04b3739?q=80&w=400&auto=format&fit=crop",
              title: "Italian Dinner",
              duration: "EVENING",
              description: "Reserved table at Il Posto with a pre-selected seasonal tasting menu and...",
            ),
            SizedBox(height: 24.h),
            
            _buildSavedCard(
              image: "https://images.unsplash.com/photo-1510798831971-661eb04b3739?q=80&w=400&auto=format&fit=crop",
              title: "Weekend Adventure",
              duration: "2 DAYS",
              description: "A curated escape to the High Ridge retreat including personal transport...",
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }

  Widget _buildSavedCard({
    required String image,
    required String title,
    required String duration,
    required String description,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
                child: Image.network(
                  image,
                  height: 160.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 16.h,
                right: 16.w,
                child: Container(
                  padding: EdgeInsets.all(8.w),
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.bookmark_border, color: AppColors.black, size: 16.sp),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CustomText(
                        text: title,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F5F5),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: CustomText(
                        text: duration,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.greyShade,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                CustomText(
                  text: description,
                  fontSize: 14.sp,
                  color: AppColors.greyShade,
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CustomText(
                          text: "View Details",
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black,
                        ),
                        SizedBox(width: 4.w),
                        Icon(Icons.arrow_forward, color: AppColors.black, size: 14.sp),
                      ],
                    ),
                    Icon(Icons.more_horiz, color: AppColors.greyShade, size: 20.sp),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
