class ApiUrl {
  static String socketUrl({required String id}) => "http://3.23.1.245:5002?userId=$id";

  static const String baseUrl = "https://receiver-hire-announcement-lodge.trycloudflare.com/api/v1";
  // static const String baseUrl = "https://hundred-charged-steel-invited.trycloudflare.com/api/v1/";
  static const String imageUrl = "https://hundred-charged-steel-invited.trycloudflare.com/";


  ///========================= Authentication =========================

  static const String signUp = "user/create_user";
  static const String verifyOtp = "user/user_verification";
  static const String login = "auth/login_user";
  static const String forgotPassword = "user/forgot_password";
  static const String verifyForgotOtp = "user/verification_forgot_user";
  static const String resetPassword = "user/reset_password";

  ///========================= Profile Screen=========================

  static const String myProfile = "auth/myprofile";
  static const String updateProfile = "auth/update_my_profile";
  static const String changePassword = "user/change_password";


  ///========================= Legal Documents =========================

  static const String aboutUs = "setting/find_by_about_us";
  static const String privacyPolicy = "setting/find_by_privacy_policys";
  static const String termsConditions = "setting/find_by_terms_conditions";


///========================= Provider Profile Setup =========================


///========================= Customer =========================


///=========================  Provider =========================





}