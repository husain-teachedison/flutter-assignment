import 'package:flutter/material.dart';
import 'package:movie_app/Pages/home.dart';
import 'package:movie_app/Pages/user.dart';
import 'package:movie_app/utils/text.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:movie_app/widgets/toprated.dart';
import 'package:movie_app/widgets/trending.dart';
import 'package:tmdb_api/tmdb_api.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;

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
    super.initState();
  }

  // fetching data from api
  loadmovies() async {
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

  static const List<Widget> _widgetOptions = <Widget>[
    Login(),
    Home(),
    Profile()
  ];

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
          ],
        ),
      ),
      // Bottom Navigation section using google navigator plugin
      // bottomNavigationBar: Container(
      //   decoration: const BoxDecoration(
      //     borderRadius: BorderRadius.only(
      //         topRight: Radius.circular(30), topLeft: Radius.circular(30)),
      //     boxShadow: [
      //       BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
      //     ],
      //   ),
      //   child: Padding(
      //     padding: const EdgeInsets.all(2.0),
      //     child: GNav(
      //         backgroundColor: const Color.fromARGB(255, 43, 43, 43),
      //         color: Colors.white,
      //         activeColor: Colors.red,
      //         onTabChange: (index) {

      //         },
      //         padding: const EdgeInsets.all(14),
      //         gap: 4,

      //         tabs: const [
      //           GButton(
      //             icon: Icons.home,
      //           ),
      //           GButton(
      //             icon: Icons.movie,
      //           ),
      //           GButton(
      //             icon: Icons.man,
      //           )
      //         ]),
      //   ),
      // )
    );
  }
}
