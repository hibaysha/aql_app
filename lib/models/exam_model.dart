// To parse this JSON data, do
//
//     final examResult = examResultFromJson(jsonString);

import 'dart:convert';

ExamResult examResultFromJson(String str) =>
    ExamResult.fromJson(json.decode(str));

String examResultToJson(ExamResult data) => json.encode(data.toJson());

class ExamResult {
  bool success;
  String message;
  List<Response> response;
  int count;
  int totalCount;
  int filterCount;

  ExamResult({
    required this.success,
    required this.message,
    required this.response,
    required this.count,
    required this.totalCount,
    required this.filterCount,
  });

  factory ExamResult.fromJson(Map<String, dynamic> json) => ExamResult(
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
  final String? id;
  final String? name;
  final Topic? topic;
  final Student? student;
  final DateTime? date;
  final String? responseSet;
  final int? attempt;
  final int? rightAnswers;
  final int? wrongAnswers;
  final int? totalAttended;
  final int? totalQuestions;
  final int? marksObtained;
  final int? totalScore;
  final int? duration;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  Response({
    this.id,
    this.name,
    this.topic,
    this.student,
    this.date,
    this.responseSet,
    this.attempt,
    this.rightAnswers,
    this.wrongAnswers,
    this.totalAttended,
    this.totalQuestions,
    this.marksObtained,
    this.totalScore,
    this.duration,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    id: json["_id"],
    name: json["name"],
    topic: json["topic"] == null ? null : Topic.fromJson(json["topic"]),
    student: json["student"] == null ? null : Student.fromJson(json["student"]),
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    responseSet: json["set"],
    attempt: json["attempt"],
    rightAnswers: json["rightAnswers"],
    wrongAnswers: json["wrongAnswers"],
    totalAttended: json["totalAttended"],
    totalQuestions: json["totalQuestions"],
    marksObtained: json["marksObtained"],
    totalScore: json["totalScore"],
    duration: json["duration"],
    createdAt:
        json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt:
        json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "topic": topic?.toJson(),
    "student": student?.toJson(),
    "date": date?.toIso8601String(),
    "set": responseSet,
    "attempt": attempt,
    "rightAnswers": rightAnswers,
    "wrongAnswers": wrongAnswers,
    "totalAttended": totalAttended,
    "totalQuestions": totalQuestions,
    "marksObtained": marksObtained,
    "totalScore": totalScore,
    "duration": duration,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

class Student {
  final String? id;
  final String? userDisplayName;
  final String? email;
  final String? mobile;
  final String? userType;
  final bool? enable;
  final String? student;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  Student({
    this.id,
    this.userDisplayName,
    this.email,
    this.mobile,
    this.userType,
    this.enable,
    this.student,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Student.fromJson(Map<String, dynamic> json) => Student(
    id: json["_id"],
    userDisplayName: json["userDisplayName"],
    email: json["email"],
    mobile: json["mobile"],
    userType: json["userType"],
    enable: json["enable"],
    student: json["student"],
    createdAt:
        json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt:
        json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "userDisplayName": userDisplayName,
    "email": email,
    "mobile": mobile,
    "userType": userType,
    "enable": enable,
    "student": student,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

class Topic {
  final String? id;
  final String? title;
  final int? chapterNo;
  final bool? isFree;
  final bool? enable;
  final Subject? subject;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  Topic({
    this.id,
    this.title,
    this.chapterNo,
    this.isFree,
    this.enable,
    this.subject,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Topic.fromJson(Map<String, dynamic> json) => Topic(
    id: json["_id"],
    title: json["title"],
    chapterNo: json["chapterNo"],
    isFree: json["isFree"],
    enable: json["enable"],
    subject: json["subject"] == null ? null : Subject.fromJson(json["subject"]),
    createdAt:
        json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt:
        json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "chapterNo": chapterNo,
    "isFree": isFree,
    "enable": enable,
    "subject": subject?.toJson(),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

class Subject {
  final String? id;
  final String? name;
  final String? description;
  final bool? isFree;
  final bool? enable;
  final Stream? stream;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  Subject({
    this.id,
    this.name,
    this.description,
    this.isFree,
    this.enable,
    this.stream,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Subject.fromJson(Map<String, dynamic> json) => Subject(
    id: json["_id"],
    name: json["name"],
    description: json["description"],
    isFree: json["isFree"],
    enable: json["enable"],
    stream: json["stream"] == null ? null : Stream.fromJson(json["stream"]),
    createdAt:
        json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt:
        json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "description": description,
    "isFree": isFree,
    "enable": enable,
    "stream": stream?.toJson(),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

class Stream {
  final String? id;
  final String? title;
  final String? description;
  final bool? isPaid;
  final int? amount;
  final int? taxPercentage;
  final bool? enable;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final String? logo;

  Stream({
    this.id,
    this.title,
    this.description,
    this.isPaid,
    this.amount,
    this.taxPercentage,
    this.enable,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.logo,
  });

  factory Stream.fromJson(Map<String, dynamic> json) => Stream(
    id: json["_id"],
    title: json["title"],
    description: json["description"],
    isPaid: json["isPaid"],
    amount: json["amount"],
    taxPercentage: json["taxPercentage"],
    enable: json["enable"],
    createdAt:
        json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt:
        json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
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
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "logo": logo,
  };
}
