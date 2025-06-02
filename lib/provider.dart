import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignInProvider with ChangeNotifier {
  String? _user;
  bool _isLoading = false;
  String? _errorMessage;

  String? get user => _user;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get isAuthenticated => _user != null;

  static const String _baseUrl = 'https://entrance-test-api.datahex.co/api/v1';

  String? get userName => null;

  Future<bool> signIn(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      _errorMessage = 'Email and Password are required.';
      notifyListeners();
      return false;
    }

    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final url = Uri.parse('$_baseUrl/auth/login/');
      // print(json.decode())

      final response = await http.post(
        url,
        // headers: {'Content-Type': 'application/json'},
        body: {"email": email, "password": password},
      );
      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        //
        print(
          "login response ${responseBody['success']}  email is ${responseBody['user']['email']}",
        );
        final isSuccess = responseBody['success'] == true;

        if (isSuccess && responseBody['user'] != null) {
          final data = responseBody['user'];
          // String userName = 'user';

          if (data is Map<String, dynamic>) {}
          _user = userName;
          _isLoading = false;
          _errorMessage = null;
          notifyListeners();
          return true;
        } else {
          _errorMessage = responseBody['message'];
          _isLoading = false;
          notifyListeners();
          return false;
        }
      } else {
        return false;
      }
    } catch (e) {
      _errorMessage = 'Something went wrong. Please try again.';
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  void signOut() {
    _user = null;
    _errorMessage = null;
    notifyListeners();
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
}
