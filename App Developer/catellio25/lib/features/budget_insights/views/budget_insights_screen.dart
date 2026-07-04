import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../global_widgets/custom_text/custom_text.dart';
import '../../../../global_widgets/custom_drawer/custom_drawer.dart';
import '../../../../core/app_routes/app_routes.dart';
import '../view_models/budget_insights_controller.dart';

class BudgetInsightsScreen extends GetView<BudgetInsightsController> {
  BudgetInsightsScreen({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xFFF9F9F9),
      drawer: const CustomDrawer(currentRoute: AppRoutes.budgetInsightsScreen),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9F9F9),
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: GestureDetector(
          onTap: () => scaffoldKey.currentState?.openDrawer(),
          child: Icon(Icons.menu, color: AppColors.black, size: 24.sp),
        ),
        title: CustomText(
          text: "Budget Insights",
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
              text: "Financial Insights",
              fontSize: 28.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
            SizedBox(height: 8.h),
            CustomText(
              text: "Your monthly capital structure, optimized for lifestyle and long-term asset growth.",
              fontSize: 14.sp,
              color: AppColors.greyShade,
            ),
            SizedBox(height: 32.h),

            // TOTAL MONTHLY ALLOCATION CARD
            Container(
              padding: EdgeInsets.all(24.w),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(24.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.02),
                    blurRadius: 16,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "TOTAL MONTHLY ALLOCATION",
                    fontSize: 10.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.greyShade,
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CustomText(
                        text: "\$45,000",
                        fontSize: 40.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 8.h, left: 8.w),
                        child: CustomText(
                          text: "/ month",
                          fontSize: 14.sp,
                          color: AppColors.greyShade,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  CustomText(
                    text: "Spending Architecture",
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                  SizedBox(height: 12.h),
                  
                  // Progress Bar
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4.r),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 20, // 9,000 is 20%
                          child: Container(height: 8.h, color: AppColors.black),
                        ),
                        Expanded(
                          flex: 45, // 20,250 is 45%
                          child: Container(height: 8.h, color: const Color(0xFF999999)),
                        ),
                        Expanded(
                          flex: 35, // 15,750 is 35%
                          child: Container(height: 8.h, color: const Color(0xFFE5E5E5)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),
                  
                  // Legend
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildLegendItem("Safe", "\$9,000", AppColors.black),
                      _buildLegendItem("Rec.", "\$20,250", const Color(0xFF999999)),
                      _buildLegendItem("Luxury", "\$15,750", const Color(0xFFE5E5E5)),
                    ],
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 40.h),
            CustomText(
              text: "Strategic Tiers",
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
            SizedBox(height: 24.h),
            
            _buildTierCard(
              title: "SAFE SPEND",
              subtitle: "\$9,000 Limit",
              description: "Conservative daily operations. Optimized for essential quality and casual local dining.",
              icon: Icons.shield_outlined,
              iconBgColor: AppColors.white,
              iconColor: AppColors.black,
              isOutlinedIconBox: true,
              pills: ["Quiet Dinners", "Daily Chauffeur"],
            ),
            SizedBox(height: 16.h),

            _buildTierCard(
              title: "RECOMMENDED",
              subtitle: "\$20,250 Optimal",
              description: "The Alfred sweet spot. Curated high-impact social events and premium travel logistics.",
              icon: Icons.auto_awesome,
              iconBgColor: AppColors.black,
              iconColor: AppColors.white,
              isOutlinedIconBox: false,
              pills: ["Michelin Star", "Club Access"],
              isBorderedCard: true,
            ),
            SizedBox(height: 16.h),

            _buildTierCard(
              title: "LUXURY SPEND",
              subtitle: "Unlimited Potential",
              description: "Exclusive, high-end experiences. Private aviation, rare art acquisitions, and gala events.",
              icon: Icons.diamond_outlined,
              iconBgColor: AppColors.white,
              iconColor: AppColors.black,
              isOutlinedIconBox: true,
              pills: ["Jet Charter", "Private Atelier"],
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }

  Widget _buildLegendItem(String title, String amount, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 6.w,
              height: 6.w,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(width: 6.w),
            CustomText(
              text: title,
              fontSize: 10.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.greyShade,
            ),
          ],
        ),
        SizedBox(height: 4.h),
        CustomText(
          text: amount,
          fontSize: 12.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.black,
        ),
      ],
    );
  }

  Widget _buildTierCard({
    required String title,
    required String subtitle,
    required String description,
    required IconData icon,
    required Color iconBgColor,
    required Color iconColor,
    required bool isOutlinedIconBox,
    required List<String> pills,
    bool isBorderedCard = false,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: isBorderedCard ? Colors.transparent : AppColors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: isBorderedCard ? Border.all(color: const Color(0xFFE0E0E0)) : null,
        boxShadow: isBorderedCard ? [] : [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: iconBgColor,
              borderRadius: BorderRadius.circular(12.r),
              border: isOutlinedIconBox ? Border.all(color: const Color(0xFFF0F0F0)) : null,
            ),
            child: Icon(icon, color: iconColor, size: 20.sp),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: CustomText(
                        text: title,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                    ),
                    CustomText(
                      text: subtitle,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                      color: isBorderedCard ? AppColors.black : AppColors.greyShade,
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                CustomText(
                  text: description,
                  fontSize: 13.sp,
                  color: AppColors.greyShade,
                ),
                SizedBox(height: 16.h),
                Wrap(
                  spacing: 8.w,
                  runSpacing: 8.h,
                  children: pills.map((pillText) => Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(100.r),
                      border: Border.all(color: const Color(0xFFEEEEEE)),
                    ),
                    child: CustomText(
                      text: pillText,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  )).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
