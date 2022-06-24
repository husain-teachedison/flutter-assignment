import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';

class TvShows extends StatelessWidget {
  final List tvShows;

  const TvShows({super.key, required this.tvShows});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top:2),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const modified_text(
            text: "Tv Shows",
            size: 20,
            color: Color.fromARGB(255, 214, 214, 214),
          ),
          SizedBox(
            height: 270,
            child: ListView.builder(
                itemCount: tvShows.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      
                    },
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
                                          tvShows[index]['poster_path']?? "none"),
                                          
                                  fit: BoxFit.cover)),
                        ),
                        Container(
                          child: modified_text(
                            text: tvShows[index]['name'] ?? 'Loading',
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
