import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotstar/controller/login_controller.dart';
import 'package:hotstar/screens/register_screen.dart';
import 'package:hotstar/widgets/auth/login_textfeild.dart';

class LoginScreen extends StatelessWidget {
  LoginController loginController = Get.put(LoginController());

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/Base 1 _ B.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 280, left: 20, right: 20),
            child: SingleChildScrollView(
              child: Form(
                key: loginController.loginFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40),
                    CustomTextField(
                      controller: loginController.emailController,
                      hintText: 'Email',
                      validator: (value) =>
                          loginController.validateEmail(value),
                    ),
                    const SizedBox(height: 16.0),
                    CustomTextField(
                      controller: loginController.passwordController,
                      hintText: 'Password',
                      obscureText: true,
                      validator: (value) =>
                          loginController.validatePassword(value),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () => Get.to(() => RegisterScreen()),
                          child: const Text(
                            'Register',
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
                        onPressed: () {
                          loginController.login(
                              loginController.emailController.text,
                              loginController.passwordController.text);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.greenAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 14.0),
                          shadowColor: Colors.black.withOpacity(0.3),
                          elevation: 8,
                        ),
                        child: const Text(
                          'Sign In',
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
          ),
        ],
      ),
    );
  }
}
