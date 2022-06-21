// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Description extends StatelessWidget {
  final String name, description, bannerurl, posterurl, vote, launch_on;

  const Description(
      {super.key,
      required this.name,
      required this.description,
      required this.bannerurl,
      required this.posterurl,
      required this.vote,
      required this.launch_on});
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: ListView(
          children: [
            SizedBox(
              height: 250,
              child: Stack(
                children: [
                  Positioned(
                      child: SizedBox(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      bannerurl,
                      fit: BoxFit.cover,
                    ),
                  )),
                  Positioned(
                      bottom: 10,
                      child: modified_text(
                          text: ' ⭐  Average Rating ' + vote,
                          color: Colors.white,
                          size: 18))
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: modified_text(
                text: name != null ? name : 'Not Loaded',
                size: 24,
                color: Colors.white,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10),
              child: modified_text(
                  text: 'releasing on - ' + launch_on,
                  color: Colors.white,
                  size: 14),
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(5),
                  height: 200,
                  width: 100,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Image.network(posterurl),
                ),
                Flexible(
                    child: Container(
                  margin: const EdgeInsets.all(5),
                  child: modified_text(
                      text: description, color: Colors.white, size: 17),
                ))
              ],
            )
          ],
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30)),
            // ignore: prefer_const_literals_to_create_immutables
            boxShadow: [
              BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: GNav(
                backgroundColor: Colors.black,
                color: Colors.white,
                activeColor: Colors.white,
                tabBackgroundColor: Colors.grey.shade800,
                onTabChange: (index) {},
                padding: const EdgeInsets.all(14),
                gap: 4,
                tabs: const [
                  GButton(
                    icon: Icons.home,
                  ),
                  GButton(
                    icon: Icons.movie,
                  ),
                  GButton(
                    icon: Icons.man,
                  )
                ]),
          ),
        ));
  }
}
