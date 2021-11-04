import 'package:bubbles_pop/home.dart';
import 'package:flutter/material.dart';

import 'game.dart';

class GameOver extends StatelessWidget {
  const GameOver({Key? key, required this.scoreCount}) : super(key: key);

  final String scoreCount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Color(0xFFF0EEE1),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Oyun Bitti",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star,
                      size: 40,
                    ),
                    Text(
                      scoreCount,
                      style: TextStyle(fontSize: 30),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color(0xFF151B2B)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(
                                color: Color(0xFF151B2B), width: 2.0),
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          const Text("Tekrar Oyna"),
                          SizedBox(
                            width: 5,
                          ),
                          const Icon(
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
                    SizedBox(
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
                              side: BorderSide(color: Colors.grey, width: 2.0),
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
                          children: [
                            Text("Anasayfa"),
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
}
