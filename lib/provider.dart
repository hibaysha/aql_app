import 'dart:convert';
import 'package:aql_app/constants/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SignInProvider with ChangeNotifier {
  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get isAuthenticated => authToken.isNotEmpty;
  String get userName => name;
  String get userEmail => email;
  String get userStudentId => studentId;
  String get userToken => authToken;
  String get getUserId => userId;

  static const String _baseUrl = 'https://entrance-test-api.datahex.co/api/v1';

  Future<bool> signIn(String emailInput, String password) async {
    if (emailInput.isEmpty || password.isEmpty) {
      _errorMessage = 'Email and Password are required.';
      notifyListeners();
      return false;
    }

    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final url = Uri.parse('$_baseUrl/auth/login/');

      final response = await http.post(
        url,
        body: {"email": emailInput, "password": password},
      );

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        debugPrint(response.body);

        final isSuccess = responseBody['success'] == true;

        if (isSuccess && responseBody['user'] != null) {
          final data = responseBody['user'];

          // Update global variables
          name = data['fullName'] ?? '';
          email = data['email'] ?? '';
          studentId = data['student'] ?? '';
          userId = data['id']?.toString() ?? '';
          authToken = responseBody['token'] ?? '';

          // Save to SharedPreferences
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('token', authToken);
          await prefs.setString('userName', name);
          await prefs.setString('userEmail', email);
          await prefs.setString('studentId', studentId);
          await prefs.setString('userId', userId);

          _isLoading = false;
          _errorMessage = null;
          notifyListeners();
          return true;
        } else {
          _errorMessage = responseBody['message'] ?? 'Sign in failed.';
          _isLoading = false;
          notifyListeners();
          return false;
        }
      } else {
        _errorMessage = 'Invalid response from server.';
        _isLoading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      _errorMessage = 'Something went wrong. Please try again.';
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> login(String emailInput, String password) async {
    // This method seems duplicate to signIn, you might want to remove one
    return await signIn(emailInput, password);
  }

  Future<void> loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();

    // Load data into global variables
    authToken = prefs.getString('token') ?? '';
    name = prefs.getString('userName') ?? '';
    email = prefs.getString('userEmail') ?? '';
    studentId = prefs.getString('studentId') ?? '';
    userId = prefs.getString('userId') ?? '';

    notifyListeners();
  }

  void signOut() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    // Clear global variables
    name = '';
    email = '';
    studentId = '';
    userId = '';
    authToken = '';
    _errorMessage = null;

    notifyListeners();
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
}
