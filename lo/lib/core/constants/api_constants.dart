// core/constants/api_constants.dart
class ApiConstants {
  static const baseUrl = "https://yourapi.com/api/v1/auth";


  static const signUp = "$baseUrl/sign-up/email";
  static const signIn = "$baseUrl/sign-in/email";
  static const signOut = "$baseUrl/sign-out";
  static const getSession = "$baseUrl/session";
  static const refreshToken = "$baseUrl/refresh";
  static const forgetPassword = "$baseUrl/forget-password";
  static const resetPassword = "$baseUrl/reset-password";
  static const changePassword = "$baseUrl/change-password";
}
