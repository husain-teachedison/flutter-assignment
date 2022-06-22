// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';

class Profile extends StatelessWidget {
  final double coverHeight = 280;
  final double ProfileHeight = 144;
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            BuildTop(),
            BuildContent(),
          ],
        ));
  }

  Widget BuildContent() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: const [
          modified_text(
            text: "Husain jinia",
            size: 23,
            color: Color.fromARGB(255, 214, 214, 214),
          ),
          modified_text(
            text: "Huge Marvel enthusiast",
            size: 17,
            color: Color.fromARGB(255, 214, 214, 214),
          ),
        ],
      ),
    );
  }

  Widget BuildTop() {
    final top = coverHeight - ProfileHeight / 2;
    final bottom = ProfileHeight / 2;
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: bottom),
          child: CoverImage(),
        ),
        Positioned(top: top, child: ProfileImage())
      ],
    );
  }

  // ignore: non_constant_identifier_names
  Widget CoverImage() => Container(
        color: Colors.grey,
        child: Image.asset('assets/movie.jpg',
            width: double.infinity, height: coverHeight, fit: BoxFit.cover),
      );
  Widget ProfileImage() => CircleAvatar(
        radius: ProfileHeight / 2,
        backgroundColor: Colors.grey.shade800,
        // ignore: prefer_const_constructors
        backgroundImage: ExactAssetImage('assets/me.jpg'),
      );
}
