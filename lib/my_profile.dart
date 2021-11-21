import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';

class My_profile extends StatefulWidget {
  const My_profile({Key? key}) : super(key: key);

  @override
  State<My_profile> createState() => _My_profileState();
}

class _My_profileState extends State<My_profile> {
  String _username = "username";
  String _email = "email@gmail.com";
  List<String> _bodyTopics = [];
  List<String> _lifeTopics = [];

  Future<String> getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    String username = prefs.getString('username') ?? "username";
    return username;
  }

  Future<String> getEmail() async {
    final prefs = await SharedPreferences.getInstance();
    String email = prefs.getString('email') ?? "email";
    return email;
  }

  Future<List<String>> getBodyTopics() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> bodyTopics = prefs.getStringList('bodyTopics') ?? [];
    return bodyTopics;
  }

  Future<List<String>> getLifeTopics() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> lifeTopics = prefs.getStringList('lifeTopics') ?? [];
    return lifeTopics;
  }

  @override
  void initState() {
    getUsername().then(updateUsername);
    getEmail().then(updateEmail);
    getBodyTopics().then(updateBodyTopics);
    getLifeTopics().then(updateLifeTopics);

    // getUsername().then((String username){
    //   setState(() {
    //     _username = username;
    //   });
    // });
    super.initState();
  }

  void updateUsername(String username) {
    setState(() {
      _username = username;
    });
  }

  void updateEmail(String email) {
    setState(() {
      _email = email;
    });
  }

  void updateBodyTopics(List<String> bodyTopics) {
    setState(() {
      _bodyTopics = bodyTopics;
    });
  }

  void updateLifeTopics(List<String> lifeTopics) {
    setState(() {
      _lifeTopics = lifeTopics;
    });
  }

  String prettyList(List<String> list) {
    String x = "";
    for (var i = 0; i < list.length; i++) {
      x += "${list[i]}, ";
    }
    return x;
  }

  final scrollController = ScrollController();

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
        body: Scrollbar(
          controller: scrollController,
          child: ListView(controller: scrollController, children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: SizedBox(
                          child: Text(
                        'Your Profile',
                        style: Theme.of(context).textTheme.headline5,
                      ))),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(48.0),
                      child: const Image(
                        image: AssetImage('assets/Logo.jpg'),
                        width: 150,
                        height: 150,
                      )),
                  Container(
                    margin: const EdgeInsets.all(11),
                    child: ElevatedButton(
                      child: const Text(
                        'Change your profile picture',
                      ),
                      onPressed: () {},
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16.0),
                      child: Text(
                        'Name: $_username',
                        style: Theme.of(context).textTheme.headline6,
                        textAlign: TextAlign.center,
                      )),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16.0),
                      child: Text(
                        'Email: $_email',
                        style: Theme.of(context).textTheme.headline6,
                        textAlign: TextAlign.center,
                      )),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16.0),
                      child: Text(
                        'Your body topics: ${prettyList(_bodyTopics)}',
                        style: Theme.of(context).textTheme.headline6,
                        textAlign: TextAlign.center,
                      )),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16.0),
                      child: Text(
                        'Your life topics: ${prettyList(_lifeTopics)}',
                        style: Theme.of(context).textTheme.headline6,
                        textAlign: TextAlign.center,
                      )),
                  Container(
                    margin: const EdgeInsets.all(11),
                    child: ElevatedButton(
                      child: const Text(
                        'Change your preferences',
                      ),
                      onPressed: () {},
                    ),
                  ),

                  // Container(
                  //   child: const FittedBox(
                  //     child: Image(
                  //       image: AssetImage('assets/Swipe.jpg'),
                  //       width: 1000,
                  //       height: 400,
                  //       fit: BoxFit.contain,
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
          ]),
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
                      'Hello $_username',
                      style: const TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  )),
              ListTile(
                title: const Text('Your Profile'),
                onTap: () {
                  // Update the state of the app

                  // ...
                  // Then close the drawer
                  // Navigator.pop(context);
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
}
