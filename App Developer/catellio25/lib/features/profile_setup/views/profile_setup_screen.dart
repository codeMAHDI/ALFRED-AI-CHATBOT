import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';
import '../view_models/profile_setup_controller.dart';
import '../widgets/profile_setup_header.dart';
import '../widgets/profile_setup_step1.dart';
import '../widgets/profile_setup_step2.dart';
import '../widgets/profile_setup_step3.dart';

class ProfileSetupScreen extends GetView<ProfileSetupController> {
  const ProfileSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            const ProfileSetupHeader(),
            Expanded(
              child: PageView(
                controller: controller.pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  ProfileSetupStep1(),
                  ProfileSetupStep2(),
                  ProfileSetupStep3(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
