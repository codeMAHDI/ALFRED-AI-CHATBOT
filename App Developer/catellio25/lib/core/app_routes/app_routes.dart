import 'package:get/get.dart';

import '../../features/splash/bindings/splash_binding.dart';
import '../../features/splash/views/splash_view.dart';

class AppRoutes {
  /// ==================== INITIAL & AUTH ROUTES ====================
  static const String splashScreen = "/splash_screen";

  /// ==================== SHARED ROUTES (Profile & Chat) ====================
  // static const String editProfileScreen = "/edit_profile_screen";



  static List<GetPage> routes = [
    /// ==================== INITIAL & AUTH PAGES ====================
    GetPage(name: splashScreen, page: () => const SplashScreen(), binding: SplashBinding()),
 ];
}