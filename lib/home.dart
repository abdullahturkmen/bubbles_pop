import 'package:flutter/material.dart';

import 'game.dart';
import 'info.dart';

class StartGame extends StatefulWidget {
  const StartGame({Key? key}) : super(key: key);

  @override
  _StartGameState createState() => _StartGameState();
}

class _StartGameState extends State<StartGame> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(builder: (context) {
        return Scaffold(
          body: Builder(builder: (context) {
            return Container(
              color: Colors.amber,
              child: Stack(
                children: [
                  Container(
                    alignment: const Alignment(0, -0.4),
                    child: Text("LOGO",
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.w800)),
                  ),
                  Container(
                    alignment: const Alignment(0, 0.5),
                    child: ElevatedButton(
                      child: const Text("Oyuna Başla"),
                      style: ElevatedButton.styleFrom(primary: Colors.green),
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
                    alignment: const Alignment(0.9, 0.9),
                    child: InkWell(
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      child: const Icon(
                        Icons.info,
                        color: Colors.deepOrange,
                        size: 32.0,
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
                ],
              ),
            );
          }),
        );
      }),
    );
  }
}
