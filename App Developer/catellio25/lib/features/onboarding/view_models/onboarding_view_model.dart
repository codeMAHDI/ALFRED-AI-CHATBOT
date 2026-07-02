import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/app_strings/app_strings.dart';
import '../../../utils/app_images/app_images.dart';
import '../models/onboarding_model.dart';
import '../../../core/app_routes/app_routes.dart';

class OnboardingViewModel extends GetxController {
  final PageController pageController = PageController();
  var currentPage = 0.obs;

  final List<OnboardingModel> pages = [
    OnboardingModel(
      title: AppStrings.planYourLife,
      subtitle: AppStrings.planYourLifeSub,
      imagePath: AppImages.onboarding1,
      imageWidth: 292,
      imageHeight: 292,
    ),
    OnboardingModel(
      title: AppStrings.meetAlfred,
      subtitle: AppStrings.meetAlfredSub,
      imagePath: AppImages.onboarding2,
      imageWidth: 342,
      imageHeight: 510,
      tag1: AppStrings.tailoredSuggestions,
      tag2: AppStrings.premiumAccess,
    ),
    OnboardingModel(
      title: AppStrings.smartPlanning,
      subtitle: AppStrings.smartPlanningSub,
      imagePath: AppImages.onboarding3,
      imageWidth: 342,
      imageHeight: 320,
      featureTitle1: AppStrings.exclusiveDining,
      featureDesc1: AppStrings.exclusiveDiningSub,
      featureTitle2: AppStrings.bespokeTravel,
      featureDesc2: AppStrings.bespokeTravelSub,
    ),
  ];

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  void nextPage() {
    if (currentPage.value < pages.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      // Navigate to Sign In after last onboarding page
      Get.offAllNamed(AppRoutes.signInScreen);
    }
  }

  void previousPage() {
    if (currentPage.value > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  void navigateToLogin() {
    Get.offAllNamed(AppRoutes.signInScreen);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
