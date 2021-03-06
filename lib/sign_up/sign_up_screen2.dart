import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:rise_hq/sign_up/sign_up_screen3.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SingUpScreen2 extends StatefulWidget {
  const SingUpScreen2({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SignUpScreen2State();
}

class _SignUpScreen2State extends State<SingUpScreen2> {
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

  void saveBodyTopics() async {
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
    prefs.setStringList("bodyTopics", selectedTopics);
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
          fontFamily: 'Gordita',
        ),
        home: Scaffold(
            appBar: AppBar(
                title: const Text("Start your journey (2/4)")),
            body: Scrollbar(
                controller: scrollController,
                child: ListView(
                  controller: scrollController,
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 16.0),
                        child: Text(
                          'First choose your body topics:',
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
                                saveBodyTopics();

                                var navigationResult = Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SingUpScreen3()));
                              },
                              child: const Text('Next'),
                            ))),
                  ],
                ))));
  }
}
