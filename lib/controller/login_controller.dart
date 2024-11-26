import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotstar/widgets/custom_snackbar.dart'; // Ensure this is correctly implemented
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginController extends GetxController {
  var isLoading = false.obs;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  // Login Function
  Future<void> login(String email, String password) async {
    if (loginFormKey.currentState!.validate()) {
      isLoading.value = true; // Start loading
      final url = Uri.parse('https://reqres.in/api/login');

      try {
        final response = await http.post(
          url,
          body: json.encode({
            "email": email,
            "password": password,
          }),
          headers: {"Content-Type": "application/json"},
        );

        isLoading.value = false; // Stop loading after response

        if (response.statusCode == 200) {
          final responseData = json.decode(response.body);
          // Handle success (e.g., store token or navigate)
          CustomSnackbar.show(
            title: 'Success',
            description: 'Login Successful!',
            backgroundColor: Colors.green.shade600,
            icon: const Icon(
              Icons.check_circle,
              color: Colors.white,
            ),
          );
          print(
              'Token: ${responseData['token']}'); // Example of using response data
        } else {
          // Show server error message if available
          final errorMessage =
              json.decode(response.body)['error'] ?? 'Login failed';
          CustomSnackbar.show(
            title: 'Error',
            description: errorMessage,
            backgroundColor: Colors.red.shade600,
            icon: const Icon(
              Icons.cancel_outlined,
              color: Colors.white,
            ),
          );
        }
      } catch (e) {
        isLoading.value = false; // Stop loading in case of error
        CustomSnackbar.show(
          title: 'Login Failed',
          description: 'An error occurred. Please try again later.',
          backgroundColor: Colors.red.shade600,
          icon: const Icon(
            Icons.error,
            color: Colors.white,
          ),
        );
        print('Error: $e'); // Debugging info
      }
    } else {
      CustomSnackbar.show(
        title: 'Error',
        description: 'Please enter valid credentials',
        backgroundColor: Colors.red.shade600,
        icon: const Icon(
          Icons.cancel_outlined,
          color: Colors.white,
        ),
      );
    }
  }

  // Email Validator
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email address';
    } else if (!RegExp(r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$")
        .hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  // Password Validator
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    return null;
  }

  // Generic Field Validator
  String? textFieldValidation(String? value) {
    if (value == null || value.isEmpty) {
      return "This field is required";
    }
    return null;
  }

  // @override
  // void onClose() {
  //   emailController.dispose();
  //   passwordController.dispose();
  //   super.onClose();
  // }
}
