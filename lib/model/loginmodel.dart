// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  Data data;
  String message;

  factory User.fromJson(Map<String, dynamic> json) => User(
        success: json["success"],
        data: Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
        "message": message,
      };
}

class Data {
  Data({
    this.userDetails,
    this.token,
  });

  UserDetails? userDetails;
  String? token;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userDetails: UserDetails.fromJson(json["user_details"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "user_details": userDetails?.toJson(),
        "token": token,
      };
}

class UserDetails {
  UserDetails({
    this.id,
    this.name,
    this.fullName,
    this.email,
    this.mobileNo,
    this.emailVerifiedAt,
    this.gender,
    this.dob,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  String? fullName;
  String? email;
  String? mobileNo;
  dynamic? emailVerifiedAt;
  String? gender;
  DateTime? dob;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        id: json["id"],
        name: json["name"],
        fullName: json["full_name"],
        email: json["email"],
        mobileNo: json["mobile_no"],
        emailVerifiedAt: json["email_verified_at"],
        gender: json["gender"],
        dob: DateTime.parse(json["dob"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "full_name": fullName,
        "email": email,
        "mobile_no": mobileNo,
        "email_verified_at": emailVerifiedAt,
        "gender": gender,
        "dob": dob?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
