import 'package:aql_app/constants/apis.dart';
import 'package:aql_app/models/exam_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ExamResultProvider with ChangeNotifier {
  ExamResult? _examResult;
  bool _isLoading = false;
  String? _error;

  ExamResult? get examResult => _examResult;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchExamResult() async {
    debugPrint('Starting fetchExamResult...');
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      debugPrint('📡 Making API call to: ${Apis.submitExamResultUrl()}');

      final response = await http.get(
        Uri.parse(Apis.submitExamResultUrl()),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final responseBody = response.body;

        // Check if response is empty
        if (responseBody.isEmpty) {
          _error = 'Empty response from server';
          _isLoading = false;
          notifyListeners();
          return;
        }

        try {
          debugPrint(responseBody);
          debugPrint("responseBody");
          _examResult = examResultFromJson(responseBody);
          print(_examResult?.response.length);
          print("_examResult?.response.length");
        } catch (e) {
          debugPrint("error in api call in catch $e");
        }
      } else {
        debugPrint("error in api call");
      }

      _isLoading = false;
      notifyListeners();
      debugPrint('🏁 fetchExamResult completed');
    } catch (e) {}
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }

  void clearData() {
    _examResult = null;
    _error = null;
    _isLoading = false;
    notifyListeners();
  }
}
