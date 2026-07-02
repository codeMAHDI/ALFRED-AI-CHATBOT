import 'package:flutter/material.dart';
import '../custom_text/custom_text.dart';

class CustomTabBar extends StatelessWidget {
  final List<String> tabs;
  final int selectedIndex;
  final ValueChanged<int> onTabSelected;
  final Color selectedColor;
  final Color unselectedColor;
  final Color? textColor;
  final bool? isTextColorActive;
  final bool? isPadding;
  final Color? activeTextColor;
  final double? textSize;

  const CustomTabBar({
    super.key,
    required this.tabs,
    required this.selectedIndex,
    required this.onTabSelected,
    required this.selectedColor,
    required this.unselectedColor,
    this.textColor,
    this.isTextColorActive = false,
    this.isPadding = true,
    this.activeTextColor,
    this.textSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0,
            color: unselectedColor,
          ),
        ),
      ),
      padding: isPadding!
          ? const EdgeInsets.symmetric(horizontal: 22)
          : const EdgeInsets.symmetric(horizontal: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(tabs.length, (index) {
          return GestureDetector(
            onTap: () => onTabSelected(index),
            child: Container(
              padding: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                //color: AppColors.red,
                border: Border(
                  bottom: BorderSide(
                    color: selectedIndex == index
                        ? selectedColor
                        : Colors.transparent,
                    width: 2.0,
                  ),
                ),
              ),
              child: CustomText(
                text: tabs[index],
                color: selectedIndex == index
                    ? (activeTextColor ?? selectedColor)
                    : isTextColorActive!
                    ? (textColor ?? unselectedColor)
                    : unselectedColor,
                fontSize: textSize ?? 16,
                fontWeight: selectedIndex == index
                    ? FontWeight.w600
                    : FontWeight.w500,
              ),
            ),
          );
        }),
      ),
    );
  }
}