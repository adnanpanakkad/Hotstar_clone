import 'package:flutter/material.dart';

Widget buildFutureBuilder({
    required Future future,
    required Widget Function(BuildContext context, AsyncSnapshot snapshot)
        builder,
  }) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        } else if (snapshot.hasData) {
          return builder(context, snapshot);
        } else {
          return const SizedBox(); 
        }
      },
    );
  }