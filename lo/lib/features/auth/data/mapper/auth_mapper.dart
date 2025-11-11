import 'package:eotc_melodies/features/auth/domain/entities/auth_entity.dart';
import 'package:eotc_melodies/shared/models/user_model.dart';

class AuthMapper {
  static AuthEntity fromJson(Map<String, dynamic> json) {
    return AuthEntity(
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
      user: UserModel.fromJson(json['user']),
    );
  }

  static Map<String, dynamic> toJson(AuthEntity entity) {
    return {
      "accessToken": entity.accessToken,
      "refreshToken": entity.refreshToken,
      "user": entity.user.toJson(),
    };
  }
}
