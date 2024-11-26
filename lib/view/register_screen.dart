import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotstar/controller/register_controller.dart';
import 'package:hotstar/view/login_screen.dart';
import 'package:hotstar/widgets/login_textfeild.dart';

class RegisterScreen extends StatelessWidget {
  RegisterController registerController = Get.put(RegisterController());

  RegisterScreen({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    "assets/Base 1 _ B.png"), // Background image path
                fit: BoxFit.fill, // Ensures the image covers the screen
              ),
            ),
          ),
          // Form and Content
          Padding(
            padding: const EdgeInsets.only(top: 280, left: 20, right: 20),
            child: Form(
              key: registerController.registerFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),
                  CustomTextField(
                    controller: registerController.emailController,
                    hintText: 'Email',
                    validator: (value) =>
                        registerController.validateEmail(value),
                  ),
                  const SizedBox(height: 16.0),
                  CustomTextField(
                    controller: registerController.passwordController,
                    hintText: 'Password',
                    obscureText: true,
                    validator: (value) =>
                        registerController.validatePassword(value),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () => Get.to(() => LoginScreen()),
                        child: const Text(
                          'login',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14.0),
                        shadowColor: Colors.black.withOpacity(0.3),
                        elevation: 8,
                      ),
                      child: const Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
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
