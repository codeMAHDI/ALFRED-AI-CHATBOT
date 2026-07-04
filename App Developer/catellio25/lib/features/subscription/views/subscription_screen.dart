import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../../global_widgets/custom_text/custom_text.dart';
import '../../../../global_widgets/custom_royel_appbar/custom_royel_appbar.dart';
import '../view_models/subscription_controller.dart';
import '../widgets/plan_card.dart';
import '../widgets/plan_feature.dart';

class SubscriptionScreen extends GetView<SubscriptionController> {
  const SubscriptionScreen({super.key});

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
                fontSize: 48.sp,
                fontWeight: FontWeight.w800,
                color: AppColors.black,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 12.h),
            Center(
              child: CustomText(
                text: AppStrings.unlockFullPotential,
                fontSize: 18.sp,
                color: AppColors.greyShade,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 40.h),
            
            PlanCard(
              tag: AppStrings.essentials,
              title: AppStrings.free,
              price: AppStrings.zeroForever,
              features: const [
                PlanFeature(text: AppStrings.basicConcierge, active: true),
                PlanFeature(text: AppStrings.discoveryServices, active: true),
                PlanFeature(text: AppStrings.datingCoach, active: false),
              ],
              buttonText: AppStrings.currentPlan,
              isPopular: false,
              isButtonDark: false,
            ),
            
            SizedBox(height: 24.h),
            
            PlanCard(
              tag: AppStrings.enhanced,
              title: AppStrings.planPremium,
              price: AppStrings.twentyFourMonth,
              features: const [
                PlanFeature(text: AppStrings.voicePersonalization, active: true, icon: Icons.mic_none),
                PlanFeature(text: AppStrings.datingTips, active: true, icon: Icons.favorite_border),
                PlanFeature(text: AppStrings.secondDateIdeas, active: true, icon: Icons.calendar_today_outlined),
                PlanFeature(text: AppStrings.dressSuggestions, active: true, icon: Icons.accessibility_new_rounded),
                PlanFeature(text: AppStrings.advancedPlanning, active: true, icon: Icons.stars_outlined),
                PlanFeature(text: AppStrings.enhancedAi, active: true, icon: Icons.psychology_outlined),
              ],
              buttonText: AppStrings.upgradeToPremium.replaceAll('\n', ' '),
              isPopular: true,
              isButtonDark: true,
            ),
            
            SizedBox(height: 24.h),
            
            PlanCard(
              tag: AppStrings.ultimate,
              title: AppStrings.planElite,
              price: AppStrings.ninetyNineMonth,
              features: const [
                PlanFeature(text: AppStrings.voiceSynthesis, active: true, icon: Icons.mic_none),
                PlanFeature(text: AppStrings.dressSuggestions, active: true, icon: Icons.accessibility_new_rounded),
                PlanFeature(text: AppStrings.priorityConcierge, active: true, icon: Icons.verified_user_outlined),
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
}
