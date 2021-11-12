// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'dart:math';

import 'package:bubbles_pop/scores.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'game.dart';
import 'info.dart';

class StartGame extends StatefulWidget {
  const StartGame({Key? key}) : super(key: key);

  @override
  _StartGameState createState() => _StartGameState();
}

class _StartGameState extends State<StartGame> {
  final myController = TextEditingController();
  bool volume = true;
  var userID;

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  _setVolumeSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (volume == true) {
      //player.setVolume(0);
      await prefs.setBool('volume', false);
      volume = false;
    } else {
      //player.setVolume(1);
      await prefs.setBool('volume', true);
      volume = true;
    }
    setState(() {});
  }

  _getVolumeSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {});
    return volume = prefs.getBool('volume') ?? true;
  }

  _setUserID(userdata) async {
    var now = DateTime.now();
    var id = now.toString() + " - " + Random().nextInt(10000).toString();

    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference user_scores =
        FirebaseFirestore.instance.collection('user_scores');
    user_scores.doc(id).set({'id': id, 'user_name': userdata, 'user_score': 0});

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("userID", id);
    setState(() {});
    return userID = prefs.getString('userID') ?? null;
  }

  _getUserID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //await prefs.clear();
    setState(() {});
    return userID = prefs.getString('userID') ?? null;
  }

  @override
  void initState() {
    setState(() {
      _getVolumeSettings();
      _getUserID();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(builder: (context) {
        return Scaffold(
          body: Builder(builder: (context) {
            return Container(
              color: Color(0xFFF0EEE1),
              child: Stack(
                children: [
                  Container(
                    alignment: const Alignment(0, -0.4),
                    child: Image.asset(
                      'lib/assets/images/bubbles-pop-logo.png',
                      width: MediaQuery.of(context).size.width * 0.75,
                    ),
                  ),
                  Container(
                    alignment: const Alignment(0, 0.5),
                    child: userID == null
                        ? Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.75,
                                child: TextField(
                                  controller: myController,
                                  decoration: InputDecoration(
                                    hintText: 'Kullanıcı Adınız',
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              ElevatedButton(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text("kaydet",
                                        style: TextStyle(fontSize: 18)),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(
                                      Icons.check,
                                    ),
                                  ],
                                ),
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.black87),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.greenAccent),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(
                                          color: Colors.greenAccent,
                                          width: 2.0),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    _setUserID(myController.text);
                                  });
                                },
                              ),
                            ],
                          )
                        : ElevatedButton(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text("Oyuna Başla",
                                    style: TextStyle(fontSize: 18)),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.play_arrow,
                                ),
                              ],
                            ),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color(0xFF151B2B)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        side: BorderSide(
                                            color: Color(0xFF151B2B),
                                            width: 2.0)))),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MyApp()),
                              );
                            },
                          ),
                  ),
                  Container(
                    alignment: const Alignment(0.9, 0.85),
                    child: InkWell(
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      child: Image.asset(
                        'lib/assets/images/top-scores-icon.jpeg',
                        width: MediaQuery.of(context).size.width * 0.12,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                TopScores(userID: userID.toString()),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    alignment: const Alignment(-0.9, 0.85),
                    child: InkWell(
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      child: Icon(
                        Icons.info_outline,
                        size: 30,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const InfoPage()),
                        );
                      },
                    ),
                  ),
                  Container(
                    alignment: const Alignment(-0.9, -0.9),
                    child: InkWell(
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      child: volume
                          ? Icon(
                              Icons.volume_up,
                              size: 30,
                            )
                          : Icon(
                              Icons.volume_off,
                              size: 30,
                            ),
                      onTap: () {
                        setState(() {
                          _setVolumeSettings();
                        });
                      },
                    ),
                  ),
                ],
              ),
            );
          }),
        );
      }),
    );
  }
}
