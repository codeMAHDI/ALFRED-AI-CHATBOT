import 'package:get/get.dart';
import '../../features/home/views/home_screen.dart';
import '../../features/splash/bindings/splash_binding.dart';
import '../../features/splash/views/splash_screen.dart';
import '../../features/onboarding/bindings/onboarding_binding.dart';
import '../../features/onboarding/views/onboarding_screen.dart';
import '../../features/auth/bindings/auth_binding.dart';
import '../../features/auth/views/auth_screen.dart';
import '../../features/auth/views/sign_up_screen.dart';
import '../../features/auth/views/verify_otp_screen.dart';
import '../../features/auth/views/forgot_password_screen.dart';
import '../../features/auth/views/set_new_password_screen.dart';
import '../../features/profile_setup/bindings/profile_setup_binding.dart';
import '../../features/profile_setup/views/profile_setup_screen.dart';
import '../../features/home/bindings/main_layout_binding.dart';
import '../../features/subscription/bindings/subscription_binding.dart';
import '../../features/subscription/views/subscription_screen.dart';
import '../../features/notifications/bindings/notifications_binding.dart';
import '../../features/notifications/views/notifications_screen.dart';
import '../../features/alfred_chat/bindings/alfred_chat_binding.dart';
import '../../features/alfred_chat/views/alfred_chat_screen.dart';
import '../../features/voice_listening/bindings/voice_listening_binding.dart';
import '../../features/voice_listening/views/voice_listening_screen.dart';
import '../../features/finding_date_splash/bindings/finding_date_splash_binding.dart';
import '../../features/finding_date_splash/views/finding_date_splash_screen.dart';
import '../../features/plan_details/bindings/plan_details_binding.dart';
import '../../features/plan_details/views/plan_details_screen.dart';
import '../../features/calendar/bindings/calendar_binding.dart';
import '../../features/calendar/views/calendar_screen.dart';
import '../../features/discovery/bindings/discovery_binding.dart';
import '../../features/discovery/views/discovery_screen.dart';
import '../../features/discovery/views/discovery_details_screen.dart';
import '../../features/profile/bindings/profile_binding.dart';
import '../../features/profile/views/edit_profile_screen.dart';
import '../../features/profile/views/security_settings_screen.dart';
import '../../features/profile/views/notification_settings_screen.dart';
import '../../features/profile/views/privacy_policy_screen.dart';
import '../../features/profile/views/terms_conditions_screen.dart';
import '../../features/date_history/bindings/date_history_binding.dart';
import '../../features/date_history/views/date_history_screen.dart';
import '../../features/saved_items/bindings/saved_items_binding.dart';
import '../../features/saved_items/views/saved_items_screen.dart';
import '../../features/premium_voice_store/bindings/premium_voice_store_binding.dart';
import '../../features/premium_voice_store/views/premium_voice_store_screen.dart';
import '../../features/budget_insights/bindings/budget_insights_binding.dart';
import '../../features/budget_insights/views/budget_insights_screen.dart';

class AppRoutes {

  static const String splashScreen = "/splash_screen";
  static const String onboardingScreen = "/onboarding_screen";
  static const String authScreen = "/auth_screen";
  static const String signUpScreen = "/sign_up_screen";
  static const String verifyOtpScreen = "/verify_otp_screen";
  static const String forgotPasswordScreen = "/forgot_password_screen";
  static const String setNewPasswordScreen = "/set_new_password_screen";
  static const String profileSetupScreen = "/profile_setup_screen";
  static const String homeScreen = "/home_screen";
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
  static const String securitySettingsScreen = "/security_settings_screen";
  static const String notificationSettingsScreen = "/notification_settings_screen";
  static const String privacyPolicyScreen = "/privacy_policy_screen";
  static const String termsConditionsScreen = "/terms_conditions_screen";
  static const String dateHistoryScreen = "/date_history_screen";
  static const String savedItemsScreen = "/saved_items_screen";
  static const String premiumVoiceStoreScreen = "/premium_voice_store_screen";
  static const String budgetInsightsScreen = "/budget_insights_screen";


  static List<GetPage> routes = [
    GetPage(name: splashScreen, page: () => const SplashScreen(), binding: SplashBinding()),
    GetPage(name: onboardingScreen, page: () => const OnboardingScreen(), binding: OnboardingBinding()),
    GetPage(name: authScreen, page: () => const AuthScreen(), binding: AuthBinding()),
    GetPage(name: signUpScreen, page: () => const SignUpScreen(), binding: AuthBinding()),
    GetPage(name: verifyOtpScreen, page: () => const VerifyOtpScreen(), binding: AuthBinding()),
    GetPage(name: forgotPasswordScreen, page: () => const ForgotPasswordScreen(), binding: AuthBinding()),
    GetPage(name: setNewPasswordScreen, page: () => const SetNewPasswordScreen(), binding: AuthBinding()),
    GetPage(name: profileSetupScreen, page: () => const ProfileSetupScreen(), binding: ProfileSetupBinding()),
    GetPage(name: homeScreen, page: () => const HomeScreen(), binding: MainLayoutBinding()),
    GetPage(name: subscriptionScreen, page: () => const SubscriptionScreen(), binding: SubscriptionBinding()),
    GetPage(name: notificationsScreen, page: () => const NotificationsScreen(), binding: NotificationsBinding()),
    GetPage(name: alfredChatScreen, page: () => const AlfredChatScreen(), binding: AlfredChatBinding()),
    GetPage(name: voiceListeningScreen, page: () => const VoiceListeningScreen(), binding: VoiceListeningBinding()),
    GetPage(name: findingDateSplashScreen, page: () => const FindingDateSplashScreen(), binding: FindingDateSplashBinding()),
    GetPage(name: planDetailsScreen, page: () => const PlanDetailsScreen(), binding: PlanDetailsBinding()),
    GetPage(name: calendarScreen, page: () => const CalendarScreen(), binding: CalendarBinding()),
    GetPage(name: discoveryScreen, page: () => const DiscoveryScreen(), binding: DiscoveryBinding()),
    GetPage(name: discoveryDetailsScreen, page: () => const DiscoveryDetailsScreen(), binding: DiscoveryBinding()),
    GetPage(name: editProfileScreen, page: () => const EditProfileScreen(), binding: ProfileBinding()),
    GetPage(name: securitySettingsScreen, page: () => const SecuritySettingsScreen(), binding: ProfileBinding()),
    GetPage(name: notificationSettingsScreen, page: () => const NotificationSettingsScreen(), binding: ProfileBinding()),
    GetPage(name: privacyPolicyScreen, page: () => const PrivacyPolicyScreen(), binding: ProfileBinding()),
    GetPage(name: termsConditionsScreen, page: () => const TermsConditionsScreen(), binding: ProfileBinding()),
    GetPage(name: dateHistoryScreen, page: () =>  DateHistoryScreen(), binding: DateHistoryBinding()),
    GetPage(name: savedItemsScreen, page: () =>  SavedItemsScreen(), binding: SavedItemsBinding()),
    GetPage(name: premiumVoiceStoreScreen, page: () => PremiumVoiceStoreScreen(), binding: PremiumVoiceStoreBinding()),
    GetPage(name: budgetInsightsScreen, page: () => BudgetInsightsScreen(), binding: BudgetInsightsBinding()),
  ];
}