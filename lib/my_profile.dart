import 'package:flutter/material.dart';

import 'main.dart';

class My_profile extends StatelessWidget {
  const My_profile({Key? key}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text("Rise HQ")),
        body:   Align(
          alignment: Alignment.topCenter,

          child: Column(
            children: [
              Container(
              child: Text('Your Profile'), height: 20

      ),
              Container(
                  child: FittedBox(
                    child: Image(image: AssetImage('assets/Logo.jpg'), width: 150, height: 150,),      ),
              ),

              Container(
                margin: EdgeInsets.all(11),
                child: FlatButton(
                  child: Text(
                    'Change your profile picture',
                    style: TextStyle(fontSize: 9.0),
                  ),
                  color: Colors.blue,
                  textColor: Colors.black,
                  onPressed: () {},
                ),
              ),
              Container(
                  alignment: Alignment(-0.85,0.70),
                  child: Text('Name'), height: 20
              ),
              Container(
                  alignment: Alignment(-0.85,0.70),

                  child: Text('Age'), height: 20
              ),
              Container(
                  alignment: Alignment(-0.85,0.70),

                  child: Text('Email'), height: 20
              ),
              Container(
                  alignment: Alignment(-0.85,0.70),

                  child: Text('Country'), height: 20
              ),

              Container(
                child: FittedBox(
                  child: Image(image: AssetImage('assets/Swipe.jpg'), width: 1000, height: 400,fit: BoxFit.contain,),      ),
              )
            ],


          ),

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
              const SizedBox(
                  height: 100,
                  child: DrawerHeader(
                    child: Text('Hello NAME',
                      style: TextStyle(
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
