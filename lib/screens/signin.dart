import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> loginUser() async {
    final email = _emailController.text;
    final password = _passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      showDialog(
        context: context,
        builder:
            (_) => const AlertDialog(
              title: Text("Missing Information"),
              content: Text("Email and Password are required."),
            ),
      );
      return;
    }

    // Show loading spinner
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const Center(child: CircularProgressIndicator()),
    );

    final url = Uri.parse(
      'https://entrance-test-api.datahex.co/api/v1/auth/login/',
    );
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({"email": email, "password": password}),
      );

      Navigator.of(context).pop(); // Close loading spinner

      final responseBody = jsonDecode(response.body);
      final isSuccess =
          responseBody['success'] == true || responseBody['status'] == true;

      if (isSuccess) {
        final data = responseBody['data'];
        String userName = 'User';

        if (data != null && data is Map<String, dynamic>) {
          userName =
              data['name'] ??
              data['username'] ??
              data['user']?['name'] ??
              data['user']?['username'] ??
              'User';
        }

        showDialog(
          context: context,
          builder:
              (_) => AlertDialog(
                title: const Text("Sign In Successful"),
                content: Text("Welcome $userName"),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text("OK"),
                  ),
                ],
              ),
        );
      } else {
        final message = responseBody['message'] ?? 'Sign in failed.';
        showDialog(
          context: context,
          builder:
              (_) => AlertDialog(
                title: const Text("Sign In Failed"),
                content: Text(message),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text("OK"),
                  ),
                ],
              ),
        );
      }
    } catch (e) {
      Navigator.of(context).pop(); // Close loading spinner
      showDialog(
        context: context,
        builder:
            (_) => AlertDialog(
              title: const Text("Error"),
              content: Text("Something went wrong. Please try again.\n\n$e"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text("OK"),
                ),
              ],
            ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/signin/IMG_6110.jpg', width: double.infinity),
          Padding(
            padding: const EdgeInsets.only(top: 440),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              height: 500,
              width: double.infinity,
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15),
                  const Text(
                    'Sign in',
                    style: TextStyle(fontSize: 29, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Please enter the details \nbelow to continue',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 133, 133, 133),
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.email),
                      hintText: 'Email ID',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      hintText: 'Password',
                      suffixIcon: const Icon(Icons.visibility),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: SizedBox(
                      width: 300,
                      child: ElevatedButton(
                        onPressed: loginUser,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(
                            255,
                            73,
                            186,
                            147,
                          ),
                          padding: const EdgeInsets.all(18),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: const Text(
                          'Sign In',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("Don't have an account? "),
                      Text('Sign up', style: TextStyle(color: Colors.blue)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
