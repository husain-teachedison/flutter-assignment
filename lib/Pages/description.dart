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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 31, 31, 31),
        toolbarHeight: 50,
        title: const modified_text(
          text: 'Description',
          size: 26,
          color: Color.fromARGB(255, 197, 197, 197),
        ),
        leading:IconButton(
          icon: Icon(Icons.arrow_back, color: Color.fromARGB(255, 197, 197, 197)),
          onPressed: () => Navigator.of(context).pop(),
  ),
      ),
      
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
              text: name,
              size: 24,
              color: Colors.white,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10),
            child: modified_text(
                text: 'releasing on - $launch_on',
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
    );
  }
}
