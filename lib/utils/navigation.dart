import 'package:flutter/material.dart';
import 'package:movie_app/Pages/movies.dart';
import 'package:movie_app/Pages/user.dart';
import 'package:movie_app/models/userProfile.dart';

class Navigation extends StatefulWidget {

  Model model;
  Navigation({Key? key, required this.model}) : super(key: key);
  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[Home(), Profile()];
  
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color.fromARGB(255, 153, 153, 153),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.movie),
              label: 'Movies',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.man),
              label: 'user',
            ),
          ],
          selectedItemColor: Colors.red,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ));
  }
}
