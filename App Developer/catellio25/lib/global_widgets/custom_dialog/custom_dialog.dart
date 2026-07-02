import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/app_colors.dart';
import '../custom_button/custom_button.dart';
import '../custom_text/custom_text.dart';

class CustomConfirmationDialog extends StatelessWidget {
  final String title;
  final VoidCallback onYesTap;
  final VoidCallback onNoTap;

  const CustomConfirmationDialog({
    super.key,
    required this.title,
    required this.onYesTap,
    required this.onNoTap,
  });

  static void show({
    required String title,
    required VoidCallback onYesTap,
  }) {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: CustomConfirmationDialog(
          title: title,
          onYesTap: onYesTap,
          onNoTap: () => Get.back(),
        ),
      ),
      barrierDismissible: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomText(
            text: title,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: onYesTap,
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.red),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: const CustomText(
                    text: 'Yes',
                    color: Colors.red,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: CustomButton(
                  onTap: onNoTap,
                  title: 'No',
                  fillColor: AppColors.primary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}