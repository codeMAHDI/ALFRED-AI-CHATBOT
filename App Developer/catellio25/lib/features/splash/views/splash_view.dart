import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../../../utils/app_const/app_const.dart';
import '../view_models/splash_view_model.dart';

class SplashScreen extends GetView<SplashViewModel> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // We don't need to manually initialize the controller, GetView does it
    // and makes it available via the 'controller' property (injected by the binding).
    
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Placeholder for logo
            const Icon(
              Icons.flutter_dash,
              size: 100,
              color: AppColors.primary,
            ),
            const SizedBox(height: 24),
            Text(
              AppConstants.refreshToken,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 48),
            const CircularProgressIndicator(

            ),
          ],
        ),
      ),
    );
  }
}
