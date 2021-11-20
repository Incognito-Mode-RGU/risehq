import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'sign_up_screen4.dart';

class SingUpScreen3 extends StatefulWidget {
  const SingUpScreen3({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SignUpScreen3State();
}

class _SignUpScreen3State extends State<SingUpScreen3> {
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

  void saveLifeTopics() async {
    // obtain shared preferences
    final prefs = await SharedPreferences.getInstance();

    List<String> selectedTopics = [];
    for (var i = 0; i < topics.length; i++) {
      if (_checkedList[i]) {
        selectedTopics.add(topics[i]);
      }
    }
    // log(selectedTopics.toString());
    // set value
    prefs.setStringList("lifeTopics", selectedTopics);
  }

  List<String> topics = [
    "Pensions",
    "Sex",
    "Body health",
    "Fitness",
    "Food",
    "Mental health",
    "Finances",
    "Parenthood",
    "Relationships"
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
                title: const Text("Start your journey with Rise HQ (3/4)")),
            body: Scrollbar(
                controller: scrollController,
                child: ListView(
                  controller: scrollController,
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 16.0),
                        child: Text(
                          'Lastly What would you like to know more about in your life?',
                          style: Theme.of(context).textTheme.headline6,
                          textAlign: TextAlign.center,
                        )),
                    Padding(
                        padding: const EdgeInsets.symmetric(),
                        child: CheckboxListTile(
                          title: Text(topics[0]),
                          value: _checkedList[0],
                          onChanged: (value) {
                            setState(() {
                              _checkedList[0] = value!;
                            });
                          },
                        )),
                    Padding(
                        padding: const EdgeInsets.symmetric(),
                        child: CheckboxListTile(
                          title: Text(topics[1]),
                          value: _checkedList[1],
                          onChanged: (value) {
                            setState(() {
                              _checkedList[1] = value!;
                            });
                          },
                        )),
                    Padding(
                        padding: const EdgeInsets.symmetric(),
                        child: CheckboxListTile(
                          title: Text(topics[2]),
                          value: _checkedList[2],
                          onChanged: (value) {
                            setState(() {
                              _checkedList[2] = value!;
                            });
                          },
                        )),
                    Padding(
                        padding: const EdgeInsets.symmetric(),
                        child: CheckboxListTile(
                          title: Text(topics[3]),
                          value: _checkedList[3],
                          onChanged: (value) {
                            setState(() {
                              _checkedList[3] = value!;
                            });
                          },
                        )),
                    Padding(
                        padding: const EdgeInsets.symmetric(),
                        child: CheckboxListTile(
                          title: Text(topics[4]),
                          value: _checkedList[4],
                          onChanged: (value) {
                            setState(() {
                              _checkedList[4] = value!;
                            });
                          },
                        )),
                    Padding(
                        padding: const EdgeInsets.symmetric(),
                        child: CheckboxListTile(
                          title: Text(topics[5]),
                          value: _checkedList[5],
                          onChanged: (value) {
                            setState(() {
                              _checkedList[5] = value!;
                            });
                          },
                        )),
                    Padding(
                        padding: const EdgeInsets.symmetric(),
                        child: CheckboxListTile(
                          title: Text(topics[6]),
                          value: _checkedList[6],
                          onChanged: (value) {
                            setState(() {
                              _checkedList[6] = value!;
                            });
                          },
                        )),
                    Padding(
                        padding: const EdgeInsets.symmetric(),
                        child: CheckboxListTile(
                          title: Text(topics[7]),
                          value: _checkedList[7],
                          onChanged: (value) {
                            setState(() {
                              _checkedList[7] = value!;
                            });
                          },
                        )),
                    Padding(
                        padding: const EdgeInsets.symmetric(),
                        child: CheckboxListTile(
                          title: Text(topics[8]),
                          value: _checkedList[8],
                          onChanged: (value) {
                            setState(() {
                              _checkedList[8] = value!;
                            });
                          },
                        )),
                    Container(
                        alignment: Alignment.center,
                        child: SizedBox(
                            width: 100,
                            child: ElevatedButton(
                              onPressed: () {
                                saveLifeTopics();

                                var navigationResult = Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SingUpScreen4()));
                              },
                              child: const Text('Next'),
                            ))),
                  ],
                ))));
  }
}
