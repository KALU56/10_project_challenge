class ZemariProfileModel {
  final String id;
  final String stageName;
  final String churchName;      
  final String organization;    
  final String certificateUrl; 
  final bool isVerified;
  final String? bio;
  final String? profileImage;

  ZemariProfileModel({
    required this.id,
    required this.stageName,
    required this.churchName,
    required this.organization,
    required this.certificateUrl,
    this.isVerified = false,
    this.bio,
    this.profileImage,
  });

  factory ZemariProfileModel.fromJson(Map<String, dynamic> json) => ZemariProfileModel(
        id: json['id'],
        stageName: json['stageName'],
        churchName: json['churchName'],
        organization: json['organization'],
        certificateUrl: json['certificateUrl'],
        isVerified: json['isVerified'] ?? false,
        bio: json['bio'],
        profileImage: json['profileImage'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "stageName": stageName,
        "churchName": churchName,
        "organization": organization,
        "certificateUrl": certificateUrl,
        "isVerified": isVerified,
        "bio": bio,
        "profileImage": profileImage,
      };
}
