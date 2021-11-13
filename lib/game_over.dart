// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'dart:math';

import 'package:bubbles_pop/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'game.dart';

final firestore = FirebaseFirestore.instance;

class GameOver extends StatefulWidget {
  const GameOver({Key? key, required this.scoreCount}) : super(key: key);

  final int scoreCount;

  @override
  _GameOverState createState() => _GameOverState();
}

class _GameOverState extends State<GameOver> {
  Query<Map<String, dynamic>> userScors = firestore.collection('user_scores');
  var userID;
  var userDetailsData = [];
  var firstGameMessages = [
    'Harika! Başlangıç için güzel iş çıkardın!',
    'Muhteşem! Senin için kolay olacağını biliyordum :)',
    'Sen bir dehasın!'
  ];

  var newScoreMessages = [
    'İşte bu. Rekor nasıl kırılır göster onlara',
    'Bu senin yeni rekorun. Kendini geliştiriyorsun :)',
    'Azimli bir insan olduğunu biliyordum!'
  ];

  var lowScoreMessages = [
    'Güzel bir oyundu fakat kendi rekorunu kıramadın',
    'Rekor puanın değişmedi. Bence tekrar denemelisin',
    'Bu bir yenilgi değil. Tekrar oyna'
  ];

  _getUserID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //await prefs.clear();
    setState(() {});
    return userID = prefs.getString('userID') ?? null;
  }

  _setUserScore() async {
    FirebaseFirestore firestore = await FirebaseFirestore.instance;
    CollectionReference user_scores =
        await FirebaseFirestore.instance.collection('user_scores');

    QuerySnapshot userDetails =
        await userScors.where('id', isEqualTo: userID.toString()).get();

    final userData = userDetails.docs.map((doc) => doc.data()).toList();

    setState(() {
      userDetailsData = userData;
    });

    if (userDetailsData.length > 0) {
      if (widget.scoreCount > userDetailsData[0]['user_score']) {
        user_scores.doc(userID).set({
          'id': userID,
          'user_name': userDetailsData[0]['user_name'],
          'user_score': widget.scoreCount,
        });
      }
    }
  }

  @override
  void initState() {
    _getUserID();
    _setUserScore();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: const Color(0xFFF0EEE1),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Oyun Bitti",
                  style: TextStyle(fontSize: 20),
                ),
                getScoreText(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'lib/assets/images/score-icon.png',
                      width: 35,
                    ),
                    Text(
                      widget.scoreCount.toString(),
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xFF151B2B)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: const BorderSide(
                                color: Color(0xFF151B2B), width: 2.0),
                          ),
                        ),
                      ),
                      child: Row(
                        children: const [
                          Text("Tekrar Oyna"),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.replay,
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyApp()),
                        );
                      },
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.grey),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: const BorderSide(
                                  color: Colors.grey, width: 2.0),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const StartGame()),
                          );
                        },
                        child: Row(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Text("Anasayfa"),
                            SizedBox(
                              width: 5,
                            ),
                            const Icon(
                              Icons.home,
                            ),
                          ],
                        ))
                  ],
                ),
              ],
            ),
          )),
    );
  }

  getScoreText() {
    return userDetailsData.length > 0
        ? Container(
            margin: const EdgeInsets.all(15.0),
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: userDetailsData[0]['user_score'] == 0
                ? Text(
                    firstGameMessages[
                            Random().nextInt(firstGameMessages.length)]
                        .toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 26),
                  )
                : Center(
                    child: userDetailsData[0]['user_score'] < widget.scoreCount
                        ? Text(
                            newScoreMessages[
                                    Random().nextInt(newScoreMessages.length)]
                                .toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 26),
                          )
                        : Text(
                            lowScoreMessages[
                                    Random().nextInt(lowScoreMessages.length)]
                                .toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20),
                          )),
          )
        : SizedBox(height: 30);
  }
}
