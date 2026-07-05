import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../../global_widgets/custom_text/custom_text.dart';
import '../view_models/alfred_chat_controller.dart';
import '../../../../core/app_routes/app_routes.dart';

class AlfredChatScreen extends GetView<AlfredChatController> {
  const AlfredChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.black, size: 24.sp),
          onPressed: () => Get.back(),
        ),
        title: CustomText(
          text: AppStrings.alfredTitle,
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.black,
        ),
        centerTitle: true,
        actions: [
          CircleAvatar(
            radius: 16.r,
            backgroundColor: AppColors.greyShade.withOpacity(0.2),
            child: Icon(Icons.person, color: AppColors.greyShade, size: 20.sp),
          ),
          SizedBox(width: 24.w),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                itemCount: controller.messages.length,
                itemBuilder: (context, index) {
                  final msg = controller.messages[index];
                  // If it's the last message, make it tappable to go to the splash
                  final isLast = index == controller.messages.length - 1;
                  return GestureDetector(
                    onTap: isLast ? () => Get.toNamed(AppRoutes.findingDateSplashScreen) : null,
                    child: _buildMessageBubble(msg),
                  );
                },
              ),
            ),
          ),
          _buildBottomInputSection(),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(ChatMessage message) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.h),
      child: Column(
        crossAxisAlignment: message.isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: message.isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              if (!message.isUser) ...[
                Icon(Icons.auto_awesome, color: AppColors.greyShade, size: 12.sp),
                SizedBox(width: 4.w),
              ],
              CustomText(
                text: message.isUser ? AppStrings.you : AppStrings.chatAlfred,
                fontSize: 10.sp,
                color: AppColors.greyShade,
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            decoration: BoxDecoration(
              color: message.isUser ? AppColors.black : AppColors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                topRight: Radius.circular(16.r),
                bottomLeft: Radius.circular(message.isUser ? 16.r : 0),
                bottomRight: Radius.circular(message.isUser ? 0 : 16.r),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            constraints: BoxConstraints(maxWidth: Get.width * 0.75),
            child: CustomText(
              text: message.text,
              fontSize: 14.sp,
              color: message.isUser ? AppColors.white : AppColors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomInputSection() {
    return Container(
      padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 16.h, bottom: 40.h),
      decoration: BoxDecoration(
        color: AppColors.background,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(100.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.02),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => controller.pickMedia(),
                  child: Icon(Icons.attach_file, color: AppColors.greyShade, size: 20.sp),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: TextField(
                    controller: controller.textController,
                    style: TextStyle(fontSize: 14.sp, color: AppColors.black),
                    decoration: InputDecoration(
                      hintText: AppStrings.messageAlfred,
                      hintStyle: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.greyShade.withOpacity(0.5),
                      ),
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                    ),
                    onSubmitted: (_) => controller.sendMessage(),
                  ),
                ),
                GestureDetector(
                  onTap: () => Get.toNamed(AppRoutes.voiceListeningScreen),
                  child: Icon(Icons.mic_none, color: AppColors.greyShade, size: 20.sp),
                ),
                SizedBox(width: 12.w),
                GestureDetector(
                  onTap: () => controller.sendMessage(),
                  child: Container(
                    padding: EdgeInsets.all(8.w),
                    decoration: const BoxDecoration(
                      color: AppColors.black,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.arrow_upward, color: AppColors.white, size: 16.sp),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          CustomText(
            text: AppStrings.alfredEncrypted,
            fontSize: 10.sp,
            color: AppColors.greyShade.withOpacity(0.5),
          ),
        ],
      ),
    );
  }
}
