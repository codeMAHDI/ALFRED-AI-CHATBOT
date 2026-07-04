import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../../global_widgets/custom_text/custom_text.dart';
import '../../../../global_widgets/custom_royel_appbar/custom_royel_appbar.dart';
import '../view_models/subscription_controller.dart';

class SubscriptionView extends GetView<SubscriptionController> {
  const SubscriptionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CustomRoyelAppbar(
        titleName: AppStrings.subscription,
        leftIcon: true,
        titleColor: AppColors.black,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
        child: Column(
          children: [
            Center(
              child: CustomText(
                text: AppStrings.upgradeToPremium,
                fontSize: 32.sp,
                fontWeight: FontWeight.w800,
                color: AppColors.black,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 12.h),
            Center(
              child: CustomText(
                text: AppStrings.unlockFullPotential,
                fontSize: 14.sp,
                color: AppColors.greyShade,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 40.h),
            
            _buildPlanCard(
              tag: AppStrings.essentials,
              title: AppStrings.free,
              price: AppStrings.zeroForever,
              features: [
                _buildFeature(AppStrings.basicConcierge, true),
                _buildFeature(AppStrings.discoveryServices, true),
                _buildFeature(AppStrings.datingCoach, false),
              ],
              buttonText: AppStrings.currentPlan,
              isPopular: false,
              isButtonDark: false,
            ),
            
            SizedBox(height: 24.h),
            
            _buildPlanCard(
              tag: AppStrings.enhanced,
              title: AppStrings.planPremium,
              price: AppStrings.twentyFourMonth,
              features: [
                _buildFeature(AppStrings.voicePersonalization, true, icon: Icons.mic_none),
                _buildFeature(AppStrings.datingTips, true, icon: Icons.favorite_border),
                _buildFeature(AppStrings.secondDateIdeas, true, icon: Icons.calendar_today_outlined),
                _buildFeature(AppStrings.dressSuggestions, true, icon: Icons.accessibility_new_rounded),
                _buildFeature(AppStrings.advancedPlanning, true, icon: Icons.stars_outlined),
                _buildFeature(AppStrings.enhancedAi, true, icon: Icons.psychology_outlined),
              ],
              buttonText: AppStrings.upgradeToPremium.replaceAll('\n', ' '),
              isPopular: true,
              isButtonDark: true,
            ),
            
            SizedBox(height: 24.h),
            
            _buildPlanCard(
              tag: AppStrings.ultimate,
              title: AppStrings.planElite,
              price: AppStrings.ninetyNineMonth,
              features: [
                _buildFeature(AppStrings.voiceSynthesis, true, icon: Icons.mic_none),
                _buildFeature(AppStrings.dressSuggestions, true, icon: Icons.accessibility_new_rounded),
                _buildFeature(AppStrings.priorityConcierge, true, icon: Icons.verified_user_outlined),
              ],
              buttonText: AppStrings.selectElite,
              isPopular: false,
              isButtonDark: false,
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }

  Widget _buildPlanCard({
    required String tag,
    required String title,
    required String price,
    required List<Widget> features,
    required String buttonText,
    required bool isPopular,
    required bool isButtonDark,
  }) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        Container(
          padding: EdgeInsets.all(24.w),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(color: AppColors.white_50, width: 2),
            boxShadow: [
              if (isPopular)
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: isPopular ? 8.h : 0),
              CustomText(
                text: tag,
                fontSize: 10.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.greyShade,
              ),
              SizedBox(height: 8.h),
              CustomText(
                text: title,
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
              SizedBox(height: 4.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  CustomText(
                    text: price.split(' ')[0],
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w900,
                    color: AppColors.black,
                  ),
                  SizedBox(width: 4.w),
                  CustomText(
                    text: price.substring(price.indexOf(' ')),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.greyShade,
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              ...features,
              SizedBox(height: 32.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 16.h),
                decoration: BoxDecoration(
                  color: isButtonDark ? AppColors.black : AppColors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  border: isButtonDark ? null : Border.all(color: AppColors.white_50),
                ),
                child: Center(
                  child: CustomText(
                    text: buttonText,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: isButtonDark ? AppColors.white : AppColors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
        if (isPopular)
          Positioned(
            top: -12.h,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: AppColors.black,
                borderRadius: BorderRadius.circular(100.r),
              ),
              child: CustomText(
                text: AppStrings.mostPopular,
                fontSize: 10.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildFeature(String text, bool active, {IconData? icon}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        children: [
          Icon(
            icon ?? (active ? Icons.check_circle_outline : Icons.block),
            color: active ? AppColors.greyShade : AppColors.white_50,
            size: 20.sp,
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: CustomText(
              text: text,
              fontSize: 14.sp,
              color: active ? AppColors.black : AppColors.greyShade.withOpacity(0.5),
              decoration: active ? null : TextDecoration.lineThrough,
            ),
          ),
        ],
      ),
    );
  }
}
