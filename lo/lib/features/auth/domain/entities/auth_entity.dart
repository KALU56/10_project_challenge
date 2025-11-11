import 'package:eotc_melodies/shared/models/user_model.dart';



class AuthEntity {
  final String accessToken;
  final String refreshToken;
  final UserModel user;

  AuthEntity({
    required this.accessToken,
    required this.refreshToken,
    required this.user,
  });
}
