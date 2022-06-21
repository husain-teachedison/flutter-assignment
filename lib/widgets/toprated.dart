import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';

class TopRated extends StatelessWidget {
  final List toprated;

  const TopRated({super.key, required this.toprated});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top:2),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const modified_text(
            text: "Top rated Movies",
            size: 20,
            color: Color.fromARGB(255, 214, 214, 214),
          ),
          SizedBox(
            height: 270,
            child: ListView.builder(
                itemCount: toprated.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(5),
                      width: 160,
                      child: Column(children: [
                        Container(
                          height: 200,
                          margin: EdgeInsets.only(top:8),
                          // ignore: prefer_interpolation_to_compose_strings
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500' +
                                          toprated[index]['poster_path']),
                                  fit: BoxFit.cover)),
                        ),
                        Container(
                          child: modified_text(
                            text: toprated[index]['title'] ?? 'Loading',
                            size: 13,
                            color: Color.fromARGB(255, 214, 214, 214),
                          ),
                        )
                      ]),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
