import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:rise_hq/sign_up/sign_up_screen2.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SingUpScreen1 extends StatefulWidget {
  const SingUpScreen1({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SignUpScreen1State();
}

class _SignUpScreen1State extends State<SingUpScreen1> {
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

  List<String> topics = [
    "Puberty",
    "Pregnancy",
    "Periods",
    "Post fertility",
    "Hormones",
    "Infertility",
    "Pregnancy loss",
    "Contraception",
    "Fertility"
  ];

  final List<bool> _checkedList = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

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
                title: const Text("Start your journey with Rise HQ (1/4)")),
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
                              "Welcome to Rise HQ $_username",
                              style: Theme.of(context).textTheme.headline5,
                              textAlign: TextAlign.center,
                            ))),
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 32.0),
                            child: Text(
                              'We know you’re unique, and at RISE HQ we’re all about making sure what you see relates to you. So we’d like to take you through some choices so that what you see is what you need.',
                              style: Theme.of(context).textTheme.headline6,
                              textAlign: TextAlign.center,
                            )),
                        Container(
                            alignment: Alignment.center,
                            child: SizedBox(
                                width: 100,
                                child: ElevatedButton(
                                  onPressed: () {
                                    var navigationResult = Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SingUpScreen2()));
                                  },
                                  child: const Text('Next'),
                                ))),
                      ],
                    )))));
  }
}
