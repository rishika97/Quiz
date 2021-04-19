import 'package:flutter/material.dart';
import 'package:quiz/components/rounded_button.dart';
import 'package:quiz/constants.dart';
import 'package:quiz/quiz/1.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  User user;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: kCardColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TypewriterAnimatedTextKit(
                text: ['Begin The Quiz'],
                textStyle: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                    color: Colors.white),
              ),
              RoundedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => One()));
                  },
                  colour: Colors.purpleAccent,
                  title: 'Start Quiz'),
            ],
          ),
        ),
      ),
    );
  }
}
