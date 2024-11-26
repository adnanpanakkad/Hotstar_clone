import 'package:flutter/material.dart';
import 'package:hotstar/widgets/home/appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const logo = "assets/disney.jpg";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(logo, context),
      //body: ,
    );
  }
}
