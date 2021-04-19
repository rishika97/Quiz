import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:quiz/components/rounded_button.dart';
import 'package:quiz/constants.dart';
import 'package:quiz/quiz/1.dart';
import 'package:quiz/screens/home_screen.dart';

class Result extends StatefulWidget {
  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  var counter = 100;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        backgroundColor: kCardColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TypewriterAnimatedTextKit(
                text: ['Your Score is '],
                textStyle: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                    color: Colors.white),
              ),
              Container(
                width: 110,
                height: 110,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TypewriterAnimatedTextKit(
                      text: ['$count'],
                      textStyle: TextStyle(
                          fontSize: 45.0,
                          fontWeight: FontWeight.w900,
                          color: kCardColor),
                    ),
                  ],
                ),
              ),
              RoundedButton(
                onPressed: () {
                  count = 0;
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                title: 'Take The Quiz Again',
                colour: Colors.purpleAccent,
              )
            ],
          ),
        ),
      ),
    );
  }
}
