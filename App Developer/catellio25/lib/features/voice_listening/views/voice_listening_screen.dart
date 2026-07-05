import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../../utils/app_images/app_images.dart';
import '../../../../global_widgets/custom_text/custom_text.dart';
import '../../../../global_widgets/custom_royel_appbar/custom_royel_appbar.dart';
import '../../../../global_widgets/animated_sparking_orb/animated_sparking_orb.dart';
import '../view_models/voice_listening_controller.dart';

class VoiceListeningScreen extends GetView<VoiceListeningController> {
  const VoiceListeningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CustomRoyelAppbar(
        titleName: AppStrings.alfredTitle,
        leftIcon: true,
        titleColor: AppColors.black,
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 60.h),
            Obx(() {
              String lottiePath = 'assets/lottie/spark.json'; // Default for idle
              String stateText = 'Tap and hold to speak';
              
              if (controller.currentState.value == VoiceBotState.listening) {
                lottiePath = 'assets/lottie/alfred_2.json';
                stateText = AppStrings.listening;
              } else if (controller.currentState.value == VoiceBotState.thinking) {
                lottiePath = 'assets/lottie/alfred_2.json';
                stateText = 'Thinking...';
              } else if (controller.currentState.value == VoiceBotState.speaking) {
                lottiePath = 'assets/lottie/spark.json';
                stateText = 'Speaking...';
              }

              return Column(
                children: [
                  Center(
                    child: AnimatedSparkingOrb(
                      imagePath: AppImages.orbImage,
                      lottieSparkPath: lottiePath,
                      width: 260.w,
                      height: 260.w,
                      isListening: false,
                    ),
                  ),
                  SizedBox(height: 40.h),
                  CustomText(
                    text: stateText,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ],
              );
            }),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              child: CustomText(
                text: AppStrings.voicePlaceholderText,
                fontSize: 16.sp,
                color: AppColors.greyShade,
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
            Obx(() {
              final isRecording = controller.currentState.value == VoiceBotState.listening;
              return GestureDetector(
                onTapDown: (_) => controller.startListening(),
                onTapUp: (_) => controller.stopListening(),
                onTapCancel: () => controller.stopListening(),
                child: AnimatedScale(
                  scale: isRecording ? 1.15 : 1.0,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOutBack, // Gives a premium bouncy pop effect
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    padding: EdgeInsets.all(24.w),
                    decoration: BoxDecoration(
                      color: AppColors.black,
                      shape: BoxShape.circle,
                      boxShadow: [
                        if (isRecording)
                          BoxShadow(
                            color: const Color(0xFFF39C12).withOpacity(0.6), // Beautiful golden glow
                            blurRadius: 40,
                            spreadRadius: 10,
                            offset: const Offset(0, 0),
                          )
                        else
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                      ],
                    ),
                    child: Icon(
                      Icons.mic, 
                      color: isRecording ? const Color(0xFFF39C12) : AppColors.white, 
                      size: 32.sp,
                    ),
                  ),
                ),
              );
            }),
            SizedBox(height: 60.h),
            CustomText(
              text: AppStrings.alfredConcierge,
              fontSize: 10.sp,
              color: AppColors.greyShade.withOpacity(0.5),
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}
