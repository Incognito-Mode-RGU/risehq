import 'package:flutter/material.dart';

import 'main.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.grey,
        brightness: Brightness.dark,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text("Log In")),
        body: const Center(
          child: Text("home screen"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            var navigationResult = await Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MyApp()));
          },
          // child: const Icon(Icons.add),
          child: const ImageIcon(AssetImage('assets/RiseHQBlackLogo.png')),
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
                    // decoration: BoxDecoration(
                    //   color: Colors.blue,
                    // ),
                    child: Text('Drawer Header',
                        style: Theme.of(context).textTheme.headline6),
                  )),
              ListTile(
                title: const Text('Your Profile'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
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
