import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../core/theme/app_colors.dart';

class CustomPinCode extends StatelessWidget {
  const CustomPinCode({
    super.key,
    this.controller,
    this.length = 4,
    this.activeColor = AppColors.red,
    this.onChanged,
    this.onCompleted,
  });

  final TextEditingController? controller;
  final Function(String)? onChanged;
  final Function(String)? onCompleted;
  final int length;
  final Color activeColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: PinCodeTextField(
        keyboardType: TextInputType.number,
        appContext: context,
        length: length,
        enableActiveFill: false,
        animationType: AnimationType.fade,
        animationDuration: Duration(milliseconds: 300),
        controller: controller,
        mainAxisAlignment: MainAxisAlignment.center,
        separatorBuilder: (context, index) => SizedBox(width: length >= 6 ? 6 : 8),
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(12),
          fieldHeight: 56,
          fieldWidth: length >= 6 ? 43 : 50,
          borderWidth: 1,
          inactiveColor: Color(0xFFE5E7EB),
          activeColor: activeColor,
          selectedColor: activeColor,
          activeFillColor: Colors.transparent,
          inactiveFillColor: Colors.transparent,
          selectedFillColor: Colors.transparent,
          disabledColor: Color(0xFFE5E7EB),
        ),
        backgroundColor: Colors.transparent,
        textStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: AppColors.black,
        ),
        cursorColor: activeColor,
        cursorHeight: 24,
        cursorWidth: 2,
        autoFocus: false,
        onChanged: onChanged ?? (value) {},
        onCompleted: onCompleted ?? (value) {
          print('OTP Completed: $value');
        },
      ),
    );
  }
}