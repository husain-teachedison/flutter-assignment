import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/Pages/user.dart';
import 'package:movie_app/utils/navigation.dart';
import 'package:movie_app/utils/text.dart';
import '/models/userProfile.dart';
import 'movies.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

// Authentication page or home page
class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  Model model = Model(bio: '', fullname: '');
  final String password = "enterapp";
  String fullname = '';
  String bio = '';

  @override
  Widget build(BuildContext context) {
    final halfMediaWidth = MediaQuery.of(context).size.width / 2.0;
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
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: 
                  
                  TextFormField(
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Enter you full name',
                      labelText: 'Full name',
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 2.0,
                        ),
                      ),
                    ),
                    validator: (String? value) {
                      if (value == "") {
                        return 'please enter something';
                      }
                      return null;
                    },
                    onChanged: (value) => setState(() => model.fullname = value),
                  ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: TextFormField(
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Enter a short description about yourself',
                      labelText: 'Bio',
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 2.0,
                        ),
                      ),
                    ),
                    validator: (String? value) {
                      if (value == "") {
                        return 'please enter something';
                      }
                      return null;
                    },
                    onChanged: (value) => setState(() => model.bio = value),
                  ),
                  ),
                  

                  TextFormField(
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Enter the pass code',
                      labelText: 'Password',
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 2.0,
                        ),
                      ),
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
                      margin: EdgeInsets.only(top: 20),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: const Color.fromARGB(
                                    255, 117, 25, 18), // Disable color
                              ),
                              child: const Text('Submit'),
                              onPressed: () {
                                // validating form for home page access
                                if (_formKey.currentState!.validate()) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                             Navigation(model: this.model)),
                                  );
                                }
                              },
                            )
                          ])),
                ],
              ),
            )));
  }
}
