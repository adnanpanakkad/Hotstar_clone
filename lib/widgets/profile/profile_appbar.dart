import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileAppbar extends StatelessWidget {
  const ProfileAppbar({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              title,
              style: GoogleFonts.montserrat(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const Spacer(),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
              )),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 20),
          //   child: Container(
          //     decoration: const BoxDecoration(
          //         color: Colors.blue,
          //         borderRadius: BorderRadius.all(Radius.circular(2))),
          //     width: 22,
          //     height: 22,
          //   ),
          // ),
        ],
      ),
    );
  }
}
