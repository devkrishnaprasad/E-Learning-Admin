import 'dart:convert';

class UserDetailsRecord {
  String createdAt;
  dynamic dateOfBirth;
  String email;
  String fullName;
  dynamic gender;
  bool isActive;
  dynamic lastLogin;
  dynamic phoneNumber;
  dynamic profileImage;
  String updatedAt;
  dynamic userType;
  String userToken;

  UserDetailsRecord(
      {required this.createdAt,
      required this.dateOfBirth,
      required this.email,
      required this.fullName,
      required this.gender,
      required this.isActive,
      required this.lastLogin,
      required this.phoneNumber,
      required this.profileImage,
      required this.updatedAt,
      required this.userType,
      required this.userToken});

  factory UserDetailsRecord.fromRawJson(String str) =>
      UserDetailsRecord.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserDetailsRecord.fromJson(Map<String, dynamic> json) =>
      UserDetailsRecord(
          createdAt: json["created_at"],
          dateOfBirth: json["date_of_birth"],
          email: json["email"],
          fullName: json["full_name"],
          gender: json["gender"],
          isActive: json["is_active"],
          lastLogin: json["last_login"],
          phoneNumber: json["phone_number"],
          profileImage: json["profile_image"],
          updatedAt: json["updated_at"],
          userType: json["user_type"],
          userToken: json["user_token"]);

  Map<String, dynamic> toJson() => {
        "created_at": createdAt,
        "date_of_birth": dateOfBirth,
        "email": email,
        "full_name": fullName,
        "gender": gender,
        "is_active": isActive,
        "last_login": lastLogin,
        "phone_number": phoneNumber,
        "profile_image": profileImage,
        "updated_at": updatedAt,
        "user_type": userType,
        "user_token": userToken
      };
}
