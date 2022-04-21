// To parse this JSON data, do
//
//     final update = updateFromJson(jsonString);

import 'dart:convert';

Update updateFromJson(String str) => Update.fromJson(json.decode(str));

String updateToJson(Update data) => json.encode(data.toJson());

class Update {
  Update({
    this.success,
    this.data,
    this.message,
  });

  final bool? success;
  final Data? data;
  final String? message;

  factory Update.fromJson(Map<String, dynamic> json) => Update(
        success: json["success"] == null ? null : json["success"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        message: json["message"] == null ? null : json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "data": data == null ? null : data?.toJson(),
        "message": message == null ? null : message,
      };
}

class Data {
  Data({
    this.userDetails,
  });

  final UserDetails? userDetails;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userDetails: json["user_details"] == null
            ? null
            : UserDetails.fromJson(json["user_details"]),
      );

  Map<String, dynamic> toJson() => {
        "user_details": userDetails == null ? null : userDetails?.toJson(),
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

  final int? id;
  final String? name;
  final String? fullName;
  final String? email;
  final String? mobileNo;
  final dynamic? emailVerifiedAt;
  final String? gender;
  final DateTime? dob;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        fullName: json["full_name"] == null ? null : json["full_name"],
        email: json["email"] == null ? null : json["email"],
        mobileNo: json["mobile_no"] == null ? null : json["mobile_no"],
        emailVerifiedAt: json["email_verified_at"],
        gender: json["gender"] == null ? null : json["gender"],
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "full_name": fullName == null ? null : fullName,
        "email": email == null ? null : email,
        "mobile_no": mobileNo == null ? null : mobileNo,
        "email_verified_at": emailVerifiedAt,
        "gender": gender == null ? null : gender,
        "dob": dob == null
            ? null
            : "${dob?.year.toString().padLeft(4, '0')}-${dob?.month.toString().padLeft(2, '0')}-${dob?.day.toString().padLeft(2, '0')}",
        "created_at": createdAt == null ? null : createdAt?.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt?.toIso8601String(),
      };
}
