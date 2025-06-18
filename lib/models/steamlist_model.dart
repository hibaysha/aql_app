// To parse this JSON data, do
//
//     final streamList = streamListFromJson(jsonString);

import 'dart:convert';

StreamList streamListFromJson(String str) =>
    StreamList.fromJson(json.decode(str));

String streamListToJson(StreamList data) => json.encode(data.toJson());

class StreamList {
  bool success;
  String message;
  List<Response> response;
  int count;
  int totalCount;
  int filterCount;

  StreamList({
    required this.success,
    required this.message,
    required this.response,
    required this.count,
    required this.totalCount,
    required this.filterCount,
  });

  factory StreamList.fromJson(Map<String, dynamic> json) => StreamList(
    success: json["success"],
    message: json["message"],
    response: List<Response>.from(
      json["response"].map((x) => Response.fromJson(x)),
    ),
    count: json["count"],
    totalCount: json["totalCount"],
    filterCount: json["filterCount"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "response": List<dynamic>.from(response.map((x) => x.toJson())),
    "count": count,
    "totalCount": totalCount,
    "filterCount": filterCount,
  };
}

class Response {
  String id;
  String title;
  String description;
  bool isPaid;
  int? amount;
  int? taxPercentage;
  bool enable;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  int subjectCount;
  int topicCount;
  String? logo;

  Response({
    required this.id,
    required this.title,
    required this.description,
    required this.isPaid,
    required this.amount,
    required this.taxPercentage,
    required this.enable,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.subjectCount,
    required this.topicCount,
    this.logo,
  });

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    id: json["_id"],
    title: json["title"],
    description: json["description"],
    isPaid: json["isPaid"],
    amount: json["amount"],
    taxPercentage: json["taxPercentage"],
    enable: json["enable"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    subjectCount: json["subjectCount"],
    topicCount: json["topicCount"],
    logo: json["logo"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "description": description,
    "isPaid": isPaid,
    "amount": amount,
    "taxPercentage": taxPercentage,
    "enable": enable,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "subjectCount": subjectCount,
    "topicCount": topicCount,
    "logo": logo,
  };
}
