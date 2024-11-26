import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotstar/view/home_screen.dart';
import 'package:hotstar/view/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hotstar clone',
      theme: ThemeData.dark(),
      home: LoginScreen(),
    );
  }
}
