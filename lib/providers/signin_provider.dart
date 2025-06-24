import 'package:aql_app/constants/global_variables.dart';
import 'package:aql_app/models/login_model.dart';
import 'package:aql_app/models/steamlist_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SignInProvider with ChangeNotifier {
  bool _isLoading = false;
  String? _errorMessage;
  StreamItem? _loginResponse;
  StreamList? _streamResponse;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get isAuthenticated => authToken.isNotEmpty;
  String get userName => name;
  String get userEmail => email;
  String get userStudentId => studentId;
  String get userToken => authToken;
  String get getUserId => userId;
  StreamItem get loginResponse => _loginResponse!;
  StreamList get streamResponse => _streamResponse!;

  static const String baseUrl = 'https://entrance-test-api.datahex.co/api/v1';

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
      final url = Uri.parse('$baseUrl/auth/login/');

      final response = await http.post(
        url,
        body: {"email": emailInput, "password": password},
      );

      if (response.statusCode == 200) {
        _loginResponse = streamItemFromJson(response.body);

        final isSuccess = _loginResponse?.success == true;

        if (isSuccess && _loginResponse?.user != null) {
          final data = _loginResponse?.user;

          // Extract and assign data to global variables
          name = data?.fullName ?? '';
          email = data?.email ?? '';
          studentId = data?.student ?? '';
          authToken = _loginResponse?.token ?? ''; // This was missing!
          userId = data?.id?.toString() ?? ''; // Adjust field name as needed

          // Debug prints to verify data
          debugPrint('Token from response: ${_loginResponse?.token}');
          debugPrint('Assigned authToken: $authToken');
          debugPrint('User name: $name');

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
          _errorMessage = _loginResponse?.message ?? 'Sign in failed.';
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

  Future<void> loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();

    authToken = prefs.getString('token') ?? '';
    name = prefs.getString('userName') ?? '';
    email = prefs.getString('userEmail') ?? '';
    studentId = prefs.getString('studentId') ?? '';
    userId = prefs.getString('userId') ?? '';

    // Debug prints to verify loading
    debugPrint('Loaded authToken: $authToken');
    debugPrint('Loaded name: $name');
    debugPrint('Is authenticated: ${authToken.isNotEmpty}');

    notifyListeners();
  }

  Future<void> signOut() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    notifyListeners();
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
}
