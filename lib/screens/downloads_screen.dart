import 'package:flutter/material.dart';
import 'package:hotstar/widgets/downloads/appbar_downloads.dart';

class DownloadsScreen extends StatelessWidget {
  const DownloadsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: AppbarDownloads(title: 'Downloads'),
      ),
    );
  }
}
