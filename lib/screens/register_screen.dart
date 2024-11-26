import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotstar/controller/register_controller.dart';
import 'package:hotstar/screens/login_screen.dart';
import 'package:hotstar/widgets/auth/login_textfeild.dart';

class RegisterScreen extends StatelessWidget {
  RegisterController registerController = Get.put(RegisterController());

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(top: 150.0, left: 20, right: 20),
        child: ListView(
          // padding: const EdgeInsets.all(20),
          children: [
            // Top Image
            Container(
              height: 250,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/disney.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 40),
            // Registration Form
            Form(
              key: registerController.registerFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () => Get.to(() => LoginScreen()),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        registerController.register(
                          registerController.emailController.text,
                          registerController.passwordController.text,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
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
          ],
        ),
      ),
    );
  }
}
