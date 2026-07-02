import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/app_routes/app_routes.dart';
import '../../../utils/app_strings/app_strings.dart';
import '../../../utils/app_icons/app_icons.dart';

class InterestModel {
  final String title;
  final String iconPath;
  InterestModel(this.title, this.iconPath);
}

class BudgetModel {
  final String title;
  final String price;
  BudgetModel(this.title, this.price);
}

class ProfileSetupViewModel extends GetxController {
  final PageController pageController = PageController();
  var currentStep = 1.obs; // 1 to 3

  // Step 1 data
  var nameController = ''.obs;
  var ageController = ''.obs;
  var selectedGender = 'Select'.obs;
  var locationController = ''.obs;
  final List<String> genders = ['Select', 'Male', 'Female', 'Other'];

  // Step 2 data
  var selectedInterests = <String>[].obs;
  
  final List<InterestModel> interests = [
    InterestModel(AppStrings.coffeeDates, AppIcons.coffeeIcon),
    InterestModel(AppStrings.movies, AppIcons.movieIcon),
    InterestModel(AppStrings.fineDining, AppIcons.diningIcon),
    InterestModel(AppStrings.travel, AppIcons.travelIcon),
    InterestModel(AppStrings.adventure, AppIcons.adventureIcon),
    InterestModel(AppStrings.sports, AppIcons.sportsIcon),
    InterestModel(AppStrings.nature, AppIcons.natureIcon),
    InterestModel(AppStrings.museums, AppIcons.museumsIcon),
    InterestModel(AppStrings.luxuryExperiences, AppIcons.luxuryIcon),
  ];

  void toggleInterest(String interest) {
    if (selectedInterests.contains(interest)) {
      selectedInterests.remove(interest);
    } else {
      selectedInterests.add(interest);
    }
  }

  // Step 3 data
  var selectedBudget = ''.obs;
  var customBudgetController = ''.obs;

  final List<BudgetModel> predefinedBudgets = [
    BudgetModel(AppStrings.casual, AppStrings.casualPrice),
    BudgetModel(AppStrings.standard, AppStrings.standardPrice),
    BudgetModel(AppStrings.premiumBudget, AppStrings.premiumPrice),
    BudgetModel(AppStrings.exceptional, AppStrings.exceptionalPrice),
  ];
  
  void selectBudget(String budgetTitle) {
    selectedBudget.value = budgetTitle;
    customBudgetController.value = ''; // Clear custom input if predefined is selected
  }

  void onNext() {
    if (currentStep.value < 3) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      currentStep.value++;
    } else {
      // Done with profile setup
      print("Profile setup complete!");
      Get.offAllNamed(AppRoutes.mainLayoutScreen);
    }
  }

  void onSkip() {
    print("Skipped profile setup step ${currentStep.value}");
    onNext();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
