import 'package:flutter/material.dart';
import 'package:movie_app/Pages/description.dart';
import 'package:movie_app/utils/text.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;

  const TrendingMovies({super.key, required this.trending});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const modified_text(
            text: "Trending Movies 🔥",
            size: 20,
            color: Color.fromARGB(255, 214, 214, 214),
          ),
          SizedBox(
            height: 220,
            child: ListView.builder(
                itemCount: trending.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Description(
                                  name: trending[index]['title'],
                                  description: trending[index]['overview'],
                                  bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                      trending[index]['backdrop_path'],
                                  posterurl: 'https://image.tmdb.org/t/p/w500' +
                                      trending[index]['poster_path'],
                                  vote: trending[index]['vote_average'].toString(),
                                  launch_on: trending[index]['release_date'])));
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      width: 250,
                      child: Column(children: [
                        Container(
                          margin: EdgeInsets.only(top:8),
                          width: 250,
                          height: 140,
                          // ignore: prefer_interpolation_to_compose_strings
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      // ignore: prefer_interpolation_to_compose_strings
                                      'https://image.tmdb.org/t/p/w500' +
                                          trending[index]['backdrop_path']),
                                  fit: BoxFit.cover)),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          child: modified_text(
                            text: trending[index]['title'] ?? 'Loading',
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
