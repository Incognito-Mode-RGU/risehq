import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:rise_hq/home.dart';
import 'package:rise_hq/sign_up/sign_up_screen2.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SingUpScreen4 extends StatefulWidget {
  const SingUpScreen4({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SignUpScreen4State();
}

class _SignUpScreen4State extends State<SingUpScreen4> {
  String _username = "username";

  Future<String> getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    String username = prefs.getString('username') ?? "username";
    return username;
  }

  void updateUsername(String username) {
    setState(() {
      _username = username;
    });
  }

  @override
  void initState() {
    getUsername().then(updateUsername);
    super.initState();
  }

  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.grey,
          brightness: Brightness.dark,
        ),
        home: Scaffold(
            appBar: AppBar(
                title: const Text("Start your journey with Rise HQ (4/4)")),
            body: Center(
                child: Scrollbar(
                    controller: scrollController,
                    child: ListView(
                      controller: scrollController,
                      children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.fromLTRB(
                                16.0, 100.0, 16.0, 16.0),
                            child: Center(
                                child: Text(
                              "Thanks $_username that’s you set!",
                              style: Theme.of(context).textTheme.headline5,
                              textAlign: TextAlign.center,
                            ))),
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 32.0),
                            child: Text(
                              'We know life’s a journey and things change. If they do you can update your preferences anytime in your settings.',
                              style: Theme.of(context).textTheme.headline6,
                              textAlign: TextAlign.center,
                            )),
                        Container(
                            alignment: Alignment.center,
                            child: SizedBox(
                                width: 200,
                                child: ElevatedButton(
                                  onPressed: () {
                                    var navigationResult = Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Home()));
                                  },
                                  child: const Text('Start your journey',
                                    textAlign: TextAlign.center,),
                                ))),
                      ],
                    )))));
  }
}
