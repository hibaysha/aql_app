import 'dart:convert';
import 'package:aql_app/constants/global_variables.dart';
import 'package:aql_app/models/steamlist_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class StreamsProvider with ChangeNotifier {
  StreamList? _streamResponse;

  StreamList get streamResponse => _streamResponse!;

  static const String baseUrl = 'https://entrance-test-api.datahex.co/api/v1';

  bool _isStreamLoading = false;

  bool get isStreamLoading => _isStreamLoading;
  //
  //
  //
  Future<void> fetchStreamData() async {
    _isStreamLoading = true;
    notifyListeners();
    debugPrint("fetch call worked");
    try {
      final url = Uri.parse('$baseUrl/stream');
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $authToken',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        // final json = jsonDecode(response.body);
        // print("$response");
        _streamResponse = streamListFromJson(response.body);
      } else {
        debugPrint('Stream fetch failed: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Stream fetch error: $e');
    } finally {
      _isStreamLoading = false;
      notifyListeners();
    }
  }
}
