import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rise_hq/my_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'my_profile.dart';
import 'login.dart';

import 'main.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _username = "username";

  Future<String> getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    String username = prefs.getString('username') ?? "username";
    return username;
  }

  @override
  void initState() {
    getUsername().then(updateUsername);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.grey,
        brightness: Brightness.dark,
        fontFamily: 'Gordita',

      ),
      home: Scaffold(
        appBar: AppBar(title: const Text("Rise HQ")),
        body: const Center(
          child: Text("home screen "),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            var navigationResult = await Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MyApp()));
          },
          // child: const Icon(Icons.add),
          child: const Image(image: AssetImage('assets/RiseHQBlackLogo.png')),
        ), // This trailing comma makes auto-formatting nicer for build methods.
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              SizedBox(
                  height: 100,
                  child: DrawerHeader(
                    child: Text(
                      "Hello $_username",
                      style: const TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  )),
              ListTile(
                title: const Text('Your Profile'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const My_profile()));

                  // var navigationResult = Navigator.push(context,
                  //    MaterialPageRoute(builder: (context) => const My_profile()));
                },
              ),
              ListTile(
                title: const Text('Preferences'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Saved Articles'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Get Involved'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Dark mode'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Log Out'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const MyApp()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void updateUsername(String username) {
    setState(() {
      _username = username;
    });
  }
}
