import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:movie_app/Pages/home.dart';
import 'package:movie_app/Pages/user.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/utils/text.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:movie_app/widgets/allMovies.dart';
import 'package:movie_app/widgets/topRated.dart';
import 'package:movie_app/widgets/trending.dart';
import 'package:movie_app/widgets/tvshows.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:http/http.dart' as http;
import '/apiMovies/moviesGet.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  // ignore: deprecated_member_use
  List<Movie> _movies = <Movie>[];
  List trendingMovies = [];
  List topratedmovies = [];
  List tv = [];
  // api key and token
  final String apikey = 'e8dead6e57f9039ce57b9f7e268e745d';
  final readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlOGRlYWQ2ZTU3ZjkwMzljZTU3YjlmN2UyNjhlNzQ1ZCIsInN1YiI6IjYyYjA1ZjZmNjJlODZmMDA1MDIwZDlkMSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.8f93QaUNEN6oaa6prQRrqaa8VuieOkmxvDuR7Ih6fy8';

  @override
  void initState() {
    loadmovies(); 
    _populateAllMovies();
    super.initState();
   
  }

  void _populateAllMovies() async {
    List<Movie> movies = await fetchAllMovies();
    setState(() {
      _movies = movies;
    });
  }

  // fetching top rated and top trending movies from tmdb api
  loadmovies() async {
    const String apikey = 'e8dead6e57f9039ce57b9f7e268e745d';
    const readaccesstoken =
        'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlOGRlYWQ2ZTU3ZjkwMzljZTU3YjlmN2UyNjhlNzQ1ZCIsInN1YiI6IjYyYjA1ZjZmNjJlODZmMDA1MDIwZDlkMSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.8f93QaUNEN6oaa6prQRrqaa8VuieOkmxvDuR7Ih6fy8';
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apikey, readaccesstoken),
        logConfig: const ConfigLogger(showLogs: true, showErrorLogs: true));
    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvresult = await tmdbWithCustomLogs.v3.tv.getPopular();
    // ignore: avoid_print
    print(trendingresult);
    setState(() {
      trendingMovies = trendingresult['results'];
      topratedmovies = topratedresult['results'];
      tv = tvresult['results'];
    });
    // ignore: avoid_print
    print(trendingresult);
  }

  // Widget tree for movies page
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 116, 15, 15),
        toolbarHeight: 50,
        title: const modified_text(
          text: 'Flutter assignment 🎬',
          size: 26,
          color: Color.fromARGB(255, 197, 197, 197),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 15),
        child: ListView(
          // Widgets for diffrent section of movies page
          children: [
            Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.only(bottom: 10),
              child: const modified_text(
                text: "Welcome back User !! 👋",
                size: 17,
                color: Color.fromARGB(255, 214, 214, 214),
              ),
            ),
            TrendingMovies(trending: trendingMovies),
            TopRated(toprated: topratedmovies),
            TvShows(tvShows: tv),
            AllMovies(movies: _movies)
          ],
        ),
      ),
    );
  }
}
