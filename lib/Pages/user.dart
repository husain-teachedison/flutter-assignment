// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 116, 15, 15),
          toolbarHeight: 50,
          title: const modified_text(
            text: 'User profile',
            size: 26,
            color: Color.fromARGB(255, 197, 197, 197),
          ),
        ),
    );
  }
}
