import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/theme/app_colors.dart';
import '../custom_image/custom_image.dart';
import '../custom_text/custom_text.dart';

class CustomRoyelAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String? titleName;
  final String? rightIcon;
  final IconData? rightIconData;
  final void Function()? rightOnTap;
  final bool? leftIcon;
  final bool showAddButton;
  final Color? titleColor;
  final PreferredSizeWidget? bottom;

  const CustomRoyelAppbar({
    super.key,
    this.titleName,
    this.rightIcon,
    this.rightIconData,
    this.rightOnTap,
    this.leftIcon = false,
    this.showAddButton = false,
    this.titleColor,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80,
      elevation: 0,
      foregroundColor: Colors.transparent,
      centerTitle: true,
      scrolledUnderElevation: 0,
      actions: [
        // Right icon (if provided string)
        if (rightIcon != null)
          IconButton(
            onPressed: rightOnTap,
            icon: CustomImage(
              imageSrc: rightIcon!,
              height: 32,
              width: 32,
              imageColor: AppColors.white,
            ),
          ),

        // Right icon (if provided IconData)
        if (rightIconData != null)
          IconButton(
            onPressed: rightOnTap,
            icon: Icon(rightIconData, color: AppColors.gery2, size: 24.w),
          ),

        // Add button (if showAddButton is true)
        if (showAddButton)
          Padding(
            padding: const EdgeInsets.only(right: 22),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: IconButton(
                onPressed: rightOnTap,
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 24,
                ),
                padding: EdgeInsets.zero,
              ),
            ),
          ),
      ],
      backgroundColor: Colors.transparent,
      leading: leftIcon == true ? BackButton(color: Colors.black) : null,
      title: CustomText(
        text: titleName ?? "",
        fontSize: 24.w,
        fontWeight: FontWeight.w700,
        color: AppColors.primary,
      ),
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(80 + (bottom?.preferredSize.height ?? 0));
}