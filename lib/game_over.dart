import 'package:flutter/material.dart';

import 'game.dart';

class GameOver extends StatelessWidget {
  const GameOver({Key? key, required this.scoreCount}) : super(key: key);

  final String scoreCount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.amber,
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
                ElevatedButton(
                  child: const Text("Tekrar Oyna"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MyApp()),
                    );
                  },
                ),
              ],
            ),
          )),
    );
  }
}
