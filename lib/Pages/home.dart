import 'package:flutter/material.dart';
import 'package:movie_app/Pages/user.dart';
import 'package:movie_app/utils/navigation.dart';
import 'package:movie_app/utils/text.dart';
import 'movies.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

// Authentication page or home page
class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final String password = "enterapp";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 116, 15, 15),
          toolbarHeight: 50,
          title: const modified_text(
            text: 'Movie rating App 🎬',
            size: 26,
            color: Color.fromARGB(255, 197, 197, 197),
          ),
        ),
        body: Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          child:Form(
          
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter the pass code',
                  labelText: 'Password',
                ),
                validator: (value) {
                  if (value != password) {
                    return 'Incorrect password';
                  } else if (value == "") {
                    return 'please enter something';
                  }
                  return null;
                },
              ),
              // ignore: unnecessary_new
              new Container(
                margin: EdgeInsets.only(top:10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:[ ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 117, 25, 18), // Disable color
                    ),
                    child: const Text('Submit'),
                    onPressed: () {
                      // validating form for home page access
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Navigation()),
                        );
                      }
                    },
              )])),
            ],
          ),
        )));
  }
}
