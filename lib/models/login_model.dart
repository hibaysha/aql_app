// To parse this JSON data, do
//
//     final streamItem = streamItemFromJson(jsonString);

import 'dart:convert';

StreamItem streamItemFromJson(String str) =>
    StreamItem.fromJson(json.decode(str));

String streamItemToJson(StreamItem data) => json.encode(data.toJson());

class StreamItem {
  User user;
  List<dynamic> menu;
  String token;
  bool success;
  String message;

  StreamItem({
    required this.user,
    required this.menu,
    required this.token,
    required this.success,
    required this.message,
  });

  factory StreamItem.fromJson(Map<String, dynamic> json) => StreamItem(
    user: User.fromJson(json["user"]),
    menu: List<dynamic>.from(json["menu"].map((x) => x)),
    token: json["token"],
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "user": user.toJson(),
    "menu": List<dynamic>.from(menu.map((x) => x)),
    "token": token,
    "success": success,
    "message": message,
  };
}

class User {
  UserType userType;
  String email;
  String userDisplayName;
  String id;
  String fullName;
  String student;

  User({
    required this.userType,
    required this.email,
    required this.userDisplayName,
    required this.id,
    required this.fullName,
    required this.student,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    userType: UserType.fromJson(json["userType"]),
    email: json["email"],
    userDisplayName: json["userDisplayName"],
    id: json["_id"],
    fullName: json["fullName"],
    student: json["student"],
  );

  Map<String, dynamic> toJson() => {
    "userType": userType.toJson(),
    "email": email,
    "userDisplayName": userDisplayName,
    "_id": id,
    "fullName": fullName,
    "student": student,
  };
}

class UserType {
  String id;
  String role;
  String roleDisplayName;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  UserType({
    required this.id,
    required this.role,
    required this.roleDisplayName,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory UserType.fromJson(Map<String, dynamic> json) => UserType(
    id: json["_id"],
    role: json["role"],
    roleDisplayName: json["roleDisplayName"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "role": role,
    "roleDisplayName": roleDisplayName,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}
