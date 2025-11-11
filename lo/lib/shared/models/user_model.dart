import 'zemari_profile_model.dart';

class UserModel {
  final String id;
  final String name;
  final String email;
  final String role; // USER or ZEMARI
  final String? phone;
  final String? image;
  final ZemariProfileModel? zemariProfile;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    this.phone,
    this.image,
    this.zemariProfile,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        role: json['role'],
        phone: json['phone'],
        image: json['image'],
        zemariProfile: json['zemariProfile'] != null
            ? ZemariProfileModel.fromJson(json['zemariProfile'])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "role": role,
        "phone": phone,
        "image": image,
        "zemariProfile": zemariProfile?.toJson(),
      };
}
