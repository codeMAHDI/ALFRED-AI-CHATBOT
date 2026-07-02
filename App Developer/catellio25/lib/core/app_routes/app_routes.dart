import 'package:get/get.dart';

import '../../features/splash/bindings/splash_binding.dart';
import '../../features/splash/views/splash_screen.dart';
import '../../features/onboarding/bindings/onboarding_binding.dart';
import '../../features/onboarding/views/onboarding_view.dart';
import '../../features/auth/sign_in/bindings/sign_in_binding.dart';
import '../../features/auth/sign_in/views/sign_in_view.dart';
import '../../features/auth/sign_up/bindings/sign_up_binding.dart';
import '../../features/auth/sign_up/views/sign_up_view.dart';
import '../../features/auth/otp/bindings/otp_binding.dart';
import '../../features/auth/otp/views/otp_view.dart';
import '../../features/profile_setup/bindings/profile_setup_binding.dart';
import '../../features/profile_setup/views/profile_setup_view.dart';
import '../../features/main_layout/bindings/main_layout_binding.dart';
import '../../features/main_layout/views/main_layout_view.dart';
import '../../features/subscription/bindings/subscription_binding.dart';
import '../../features/subscription/views/subscription_view.dart';
import '../../features/notifications/bindings/notifications_binding.dart';
import '../../features/notifications/views/notifications_view.dart';

class AppRoutes {

  /// ==================== INITIAL & AUTH ROUTES ====================
  static const String splashScreen = "/splash_screen";
  static const String onboardingScreen = "/onboarding_screen";
  static const String signInScreen = "/sign_in_screen";
  static const String signUpScreen = "/sign_up_screen";
  static const String otpScreen = "/otp_screen";
  static const String profileSetupScreen = "/profile_setup_screen";
  static const String mainLayoutScreen = "/main_layout_screen";
  static const String subscriptionScreen = "/subscription_screen";
  static const String notificationsScreen = "/notifications_screen";

  /// ==================== SHARED ROUTES (Profile & Chat) ====================

  static List<GetPage> routes = [
    /// ==================== INITIAL & AUTH PAGES ====================
    GetPage(name: splashScreen, page: () => const SplashScreen(), binding: SplashBinding()),
    GetPage(name: onboardingScreen, page: () => const OnboardingView(), binding: OnboardingBinding()),
    GetPage(name: signInScreen, page: () => const SignInView(), binding: SignInBinding()),
    GetPage(name: signUpScreen, page: () => const SignUpView(), binding: SignUpBinding()),
    GetPage(name: otpScreen, page: () => const OtpView(), binding: OtpBinding()),
    GetPage(name: profileSetupScreen, page: () => const ProfileSetupView(), binding: ProfileSetupBinding()),
    GetPage(name: mainLayoutScreen, page: () => const MainLayoutView(), binding: MainLayoutBinding()),
    GetPage(name: subscriptionScreen, page: () => const SubscriptionView(), binding: SubscriptionBinding()),
    GetPage(name: notificationsScreen, page: () => const NotificationsView(), binding: NotificationsBinding()),
  ];
}