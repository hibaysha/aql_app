import 'package:aql_app/constants/global_variables.dart';

class Apis {
  ///Base Url
  static String baseUrl = 'https://entrance-test-api.datahex.co/api/v1';

  static String getStreamtData() {
    return '$baseUrl/stream';
  }

  ///image Append url
  static const String imageAppend =
      "https://event-manager.syd1.cdn.digitaloceanspaces.com/";

  static String getUserProfileData() {
    return '$baseUrl/user?id=$studentId';
  }

  static String submitExamResultUrl() {
    return '$baseUrl/exam-result';
  }
}
