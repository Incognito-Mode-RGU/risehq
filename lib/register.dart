import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:rise_hq/sign_up/sign_up_screen1.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home.dart';

class Register extends StatelessWidget {
  Register({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.grey,
        brightness: Brightness.dark,
        fontFamily: 'Gordita',

      ),
      home: Scaffold(
        appBar: AppBar(title: const Text("Register")),
        body: const Center(child: MyStatefulWidget()),
      ),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final nameTextFieldController = TextEditingController();
  final emailTextFieldController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameTextFieldController.dispose();
    super.dispose();
  }

  void saveUserData() async {
    // obtain shared preferences
    final prefs = await SharedPreferences.getInstance();

    // set value
    // log("username = ${nameTextFieldController.text}");
    prefs.setString('username', nameTextFieldController.text);
    prefs.setString('email', emailTextFieldController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                'Rise HQ',
                style: Theme.of(context).textTheme.headline4,
              )),
          SizedBox(
              width: 300,
              child: TextFormField(
                controller: nameTextFieldController,
                decoration: const InputDecoration(
                  hintText: 'Name',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              )),
          SizedBox(
              width: 300,
              child: TextFormField(
                controller: emailTextFieldController,
                decoration: const InputDecoration(
                  hintText: 'Email',
                ),
                // validator: (value) => EmailValidator.validate(value) ? null : "Please enter a valid email",
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              )),
          SizedBox(
              width: 300,
              child: TextFormField(
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                decoration: const InputDecoration(
                  hintText: 'Password',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              )),
          SizedBox(
              width: 300,
              child: TextFormField(
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                decoration: const InputDecoration(
                  hintText: 'Confirm Password',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: SizedBox(
                width: 100,
                child: ElevatedButton(
                  onPressed: () {
                    // Validate will return true if the form is valid, or false if
                    // the form is invalid.
                    if (_formKey.currentState!.validate()) {
                      // Process data.
                      saveUserData();
                      var navigationResult = Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SingUpScreen1()));
                    }
                  },
                  child: const Text('Register'),
                )),
          ),
        ],
      ),
    );
  }
}
