// To parse this JSON data, do
//
//     final register = registerFromJson(jsonString);

import 'dart:convert';

Register registerFromJson(String str) => Register.fromJson(json.decode(str));

String registerToJson(Register data) => json.encode(data.toJson());

class Register {
  Register({
    this.success,
    this.data,
    this.message,
  });

  final bool? success;
  final Data? data;
  final String? message;

  factory Register.fromJson(Map<String, dynamic> json) => Register(
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
    this.token,
  });

  final UserDetails? userDetails;
  final String? token;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userDetails: json["user_details"] == null
            ? null
            : UserDetails.fromJson(json["user_details"]),
        token: json["token"] == null ? null : json["token"],
      );

  Map<String, dynamic> toJson() => {
        "user_details": userDetails == null ? null : userDetails?.toJson(),
        "token": token == null ? null : token,
      };
}

class UserDetails {
  UserDetails({
    this.fullName,
    this.email,
    this.mobileNo,
    this.gender,
    this.dob,
    this.name,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  final String? fullName;
  final String? email;
  final String? mobileNo;
  final String? gender;
  final DateTime? dob;
  final String? name;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final int? id;

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        fullName: json["full_name"] == null ? null : json["full_name"],
        email: json["email"] == null ? null : json["email"],
        mobileNo: json["mobile_no"] == null ? null : json["mobile_no"],
        gender: json["gender"] == null ? null : json["gender"],
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        name: json["name"] == null ? null : json["name"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        id: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toJson() => {
        "full_name": fullName == null ? null : fullName,
        "email": email == null ? null : email,
        "mobile_no": mobileNo == null ? null : mobileNo,
        "gender": gender == null ? null : gender,
        "dob": dob == null
            ? null
            : "${dob?.year.toString().padLeft(4, '0')}-${dob?.month.toString().padLeft(2, '0')}-${dob?.day.toString().padLeft(2, '0')}",
        "name": name == null ? null : name,
        "updated_at": updatedAt == null ? null : updatedAt?.toIso8601String(),
        "created_at": createdAt == null ? null : createdAt?.toIso8601String(),
        "id": id == null ? null : id,
      };
}
