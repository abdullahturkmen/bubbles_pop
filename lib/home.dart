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
                    child: ElevatedButton(
                      child: const Text("Oyuna Başla",
                          style: TextStyle(fontSize: 18)),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color(0xFF151B2B)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
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
