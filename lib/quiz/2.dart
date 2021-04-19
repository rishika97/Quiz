import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quiz/constants.dart';
import 'package:quiz/quiz/1.dart';
import 'package:quiz/quiz/3.dart';

class Two extends StatefulWidget {
  Two({Key key}) : super(key: key);

  @override
  _TwoState createState() => _TwoState();
}

class _TwoState extends State<Two> {
  final _firestore = FirebaseFirestore.instance;
  User user;

  void getData() async {
    final getData = await _firestore.collection("Quiz").get();
    for (var data in getData.docs) {
      print(data.data());
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: kCardColor,
          body: Center(
            child: Card(
              elevation: 10.0,
              margin: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  StreamBuilder<QuerySnapshot>(
                      stream: _firestore.collection("Quiz").snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData)
                          return Text("Loading data, Please wait..");
                        return Column(
                          children: <Widget>[
                            Text(
                              snapshot.data.docs[2]['question'],
                              style: TextStyle(
                                fontSize: 24.0,
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            RaisedButton(
                              color: kCardColor,
                              textColor: Colors.white,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Three()));
                                var correct = snapshot.data.docs[2]['correct'];
                                var option1 = snapshot.data.docs[2]['option1'];
                                if (correct == option1) {
                                  count += 10;
                                } else {
                                  if (count != 0) {
                                    count -= 0;
                                  }
                                }
                                print(count);
                              },
                              child: Text(
                                snapshot.data.docs[2]['option1'].toString(),
                                style: TextStyle(fontSize: 20.0),
                              ),
                            ),
                            RaisedButton(
                              color: kCardColor,
                              textColor: Colors.white,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Three()));
                                var correct = snapshot.data.docs[2]['correct'];

                                var option1 = snapshot.data.docs[2]['option2'];

                                if (correct == option1) {
                                  count += 10;
                                } else {
                                  if (count != 0) {
                                    count -= 0;
                                  }
                                }
                                print(count);
                              },
                              child: Text(
                                snapshot.data.docs[2]['option2'].toString(),
                                style: TextStyle(fontSize: 20.0),
                              ),
                            ),
                            RaisedButton(
                              color: kCardColor,
                              textColor: Colors.white,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Three()));
                                var correct = snapshot.data.docs[2]['correct'];
                                var option1 = snapshot.data.docs[2]['option3'];
                                if (correct == option1) {
                                  count += 10;
                                } else {
                                  if (count != 0) {
                                    count -= 0;
                                  }
                                }
                                print(count);
                              },
                              child: Text(
                                snapshot.data.docs[2]['option3'].toString(),
                                style: TextStyle(fontSize: 20.0),
                              ),
                            ),
                            RaisedButton(
                              color: kCardColor,
                              textColor: Colors.white,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Three()));
                                var correct = snapshot.data.docs[2]['correct'];

                                var option1 = snapshot.data.docs[2]['option4'];

                                if (correct == option1) {
                                  count += 10;
                                } else {
                                  if (count != 0) {
                                    count -= 0;
                                  }
                                }
                                print(count);
                              },
                              child: Text(
                                snapshot.data.docs[2]['option4'].toString(),
                                style: TextStyle(fontSize: 20.0),
                              ),
                            ),
                          ],
                        );
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
