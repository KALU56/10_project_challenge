// data/datasources/auth_remote_datasource.dart
import 'package:eotc_melodies/core/constants/api_constants.dart';
import 'package:eotc_melodies/core/network/http_service/http_service.dart';


class AuthRemoteDataSource {
  final HttpService httpService;

  AuthRemoteDataSource(this.httpService);

  Future<Map<String, dynamic>> signIn({required String email, required String password}) async {
    final response = await httpService.post(ApiConstants.signIn, {
      "email": email,
      "password": password,
    });

    if (response.success) {
      return response.data as Map<String, dynamic>;
    } else {
      throw Exception(response.message ?? "Failed to sign in");
    }
  }

  Future<Map<String, dynamic>> signUp({
    required String name,
    required String email,
    required String password,
    required String role,
    Map<String, dynamic>? zemariProfile,
  }) async {
    final body = {
      "name": name,
      "email": email,
      "password": password,
      "role": role,
      if (zemariProfile != null) "zemariProfile": zemariProfile,
    };

    final response = await httpService.post(ApiConstants.signUp, body);

    if (response.success) {
      return response.data as Map<String, dynamic>;
    } else {
      throw Exception(response.message ?? "Failed to sign up");
    }
  }

  Future<void> signOut() async {
    final response = await httpService.post(ApiConstants.signOut, {});
    if (!response.success) throw Exception(response.message ?? "Failed to sign out");
  }

  Future<Map<String, dynamic>> getSession() async {
    final response = await httpService.get(ApiConstants.getSession);
    if (response.success) {
      return response.data as Map<String, dynamic>;
    } else {
      throw Exception(response.message ?? "Failed to get session");
    }
  }

  Future<Map<String, dynamic>> refreshToken(String refreshToken) async {
    final response = await httpService.post(ApiConstants.refreshToken, {"refreshToken": refreshToken});
    if (response.success) {
      return response.data as Map<String, dynamic>;
    } else {
      throw Exception(response.message ?? "Failed to refresh token");
    }
  }

  Future<void> forgetPassword(String email) async {
    final response = await httpService.post(ApiConstants.forgetPassword, {"email": email});
    if (!response.success) throw Exception(response.message ?? "Failed to request password reset");
  }

  Future<void> resetPassword(String token, String newPassword) async {
    final response = await httpService.post(ApiConstants.resetPassword, {"token": token, "password": newPassword});
    if (!response.success) throw Exception(response.message ?? "Failed to reset password");
  }

  Future<void> changePassword(String oldPassword, String newPassword) async {
    final response = await httpService.post(ApiConstants.changePassword, {"oldPassword": oldPassword, "newPassword": newPassword});
    if (!response.success) throw Exception(response.message ?? "Failed to change password");
  }
}
