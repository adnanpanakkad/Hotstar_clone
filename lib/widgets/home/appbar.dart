import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar appBar(String logo, context) {
  return AppBar(
    backgroundColor: Colors.black,
    actions: [
      Padding(
        padding: const EdgeInsets.only(left: 15),
        child: SizedBox(
          width: 50,
          height: 40,
          child: Image.asset(
            logo,
            fit: BoxFit.cover,
          ),
        ),
      ),
      const Spacer(),
      IconButton(
          onPressed: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => ScreenSearch(),
            //   ),
            // );
          },
          icon: const Icon(
            CupertinoIcons.search,
            color: Colors.white,
          )),
      const Padding(
          padding: EdgeInsets.only(right: 20, left: 10),
          child: Icon(Icons.notifications)),
    ],
  );
}
