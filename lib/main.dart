import 'package:flutter/material.dart';
import 'Pages/home.dart';
import 'Pages/movies.dart';
import 'Pages/user.dart';
import 'utils/navigation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Login(),
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
    );
  }
}