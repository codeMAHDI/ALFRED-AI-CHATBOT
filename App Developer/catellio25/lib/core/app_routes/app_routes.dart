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
import '../../features/alfred_chat/bindings/alfred_chat_binding.dart';
import '../../features/alfred_chat/views/alfred_chat_view.dart';
import '../../features/voice_listening/bindings/voice_listening_binding.dart';
import '../../features/voice_listening/views/voice_listening_view.dart';
import '../../features/finding_date_splash/bindings/finding_date_splash_binding.dart';
import '../../features/finding_date_splash/views/finding_date_splash_view.dart';
import '../../features/plan_details/bindings/plan_details_binding.dart';
import '../../features/plan_details/views/plan_details_view.dart';
import '../../features/calendar/bindings/calendar_binding.dart';
import '../../features/calendar/views/calendar_view.dart';
import '../../features/discovery/bindings/discovery_binding.dart';
import '../../features/discovery/views/discovery_view.dart';
import '../../features/discovery_details/bindings/discovery_details_binding.dart';
import '../../features/discovery_details/views/discovery_details_view.dart';
import '../../features/edit_profile/bindings/edit_profile_binding.dart';
import '../../features/edit_profile/views/edit_profile_view.dart';

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
  static const String alfredChatScreen = "/alfred_chat_screen";
  static const String voiceListeningScreen = "/voice_listening_screen";
  static const String findingDateSplashScreen = "/finding_date_splash_screen";
  static const String planDetailsScreen = "/plan_details_screen";
  static const String calendarScreen = "/calendar_screen";
  static const String discoveryScreen = "/discovery_screen";
  static const String discoveryDetailsScreen = "/discovery_details_screen";
  static const String editProfileScreen = "/edit_profile_screen";

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
    GetPage(name: alfredChatScreen, page: () => const AlfredChatView(), binding: AlfredChatBinding()),
    GetPage(name: voiceListeningScreen, page: () => const VoiceListeningView(), binding: VoiceListeningBinding()),
    GetPage(name: findingDateSplashScreen, page: () => const FindingDateSplashView(), binding: FindingDateSplashBinding()),
    GetPage(name: planDetailsScreen, page: () => const PlanDetailsView(), binding: PlanDetailsBinding()),
    GetPage(name: calendarScreen, page: () => const CalendarView(), binding: CalendarBinding()),
    GetPage(name: discoveryScreen, page: () => const DiscoveryView(), binding: DiscoveryBinding()),
    GetPage(name: discoveryDetailsScreen, page: () => const DiscoveryDetailsView(), binding: DiscoveryDetailsBinding()),
    GetPage(name: editProfileScreen, page: () => const EditProfileView(), binding: EditProfileBinding()),
  ];
}