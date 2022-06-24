import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';

import '../models/movie.dart';

class AllMovies extends StatelessWidget {
  final List<Movie> movies;

  AllMovies({required this.movies});

  

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top:2),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const modified_text(
            text: "All Movies",
            size: 20,
            color: Color.fromARGB(255, 214, 214, 214),
          ),
          SizedBox(
            height: 270,
            child: ListView.builder(
                itemCount: movies.length,
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
                                  image: NetworkImage(movies[index].poster),
                                  fit: BoxFit.cover)),
                        ),
                        Container(
                          child: modified_text(
                            text: movies[index].title,
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
