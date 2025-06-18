class Apis {
  ///Base Url
  static String baseUrl =
      'https://online-entrance-test-api-umxbq.ondigitalocean.app/api/v1';

  static String getStreamtData() {
    return '$baseUrl/stream';
  }

  ///image Append url
  static const String imageAppend =
      "https://event-manager.syd1.cdn.digitaloceanspaces.com/";
}
