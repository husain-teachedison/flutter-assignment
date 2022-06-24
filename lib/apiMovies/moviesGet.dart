import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:movie_app/models/movie.dart';
import 'package:tmdb_api/tmdb_api.dart';

// ignore: unused_element

Future<List<Movie>> fetchAllMovies() async {
  final String apikey = 'http://www.omdbapi.com/?i=tt3896198&apikey=4f0f5fe7';

  final response = await get(Uri.parse(apikey));

  if (response.statusCode == 200) {
    final result = "[" + response.body + "]";
    print(result);
    Iterable list = (jsonDecode(result) as List<dynamic>) ;
    // ignore: avoid_print
    print(list);
    return list.map((movie) => Movie.fromJson(movie)).toList();
  } else {
    throw Exception("Failed to load movies");
  }
}
