import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar appBar(String logo, context) {
  return AppBar(
    backgroundColor: Colors.black,
    actions: [
      Padding(
        padding: EdgeInsets.only(left: 15),
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
      Padding(
        padding: const EdgeInsets.only(right: 20, left: 10),
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.greenAccent,
              borderRadius: BorderRadius.all(Radius.circular(2))),
          width: 22,
          height: 22,
        ),
      ),
    ],
  );
}
