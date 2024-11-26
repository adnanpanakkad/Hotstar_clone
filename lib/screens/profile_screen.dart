import 'package:flutter/material.dart';
import 'package:hotstar/widgets/profile/profile_appbar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: ProfileAppbar(title: 'Profile'),
      ),
    );
  }
}
