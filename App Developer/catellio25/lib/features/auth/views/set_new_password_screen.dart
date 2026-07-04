import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view_models/auth_controller.dart';

class SetNewPasswordScreen extends GetView<AuthController> {
  const SetNewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Set New Password')),
      body: const Center(
        child: Text('Set New Password Screen'),
      ),
    );
  }
}
