// ignore_for_file: non_constant_identifier_names

import 'dart:math';
import 'package:bubbles_pop/game_over.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'main.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bubbles Pop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Builder(builder: (context) {
        return const Scaffold(body: GamePage());
      }),
    );
  }
}

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  //final xPos = Random().nextDouble();
  //final yPos = Random().nextDouble();

  //Navigator.push(context, MaterialPageRoute(builder: (context) => GameOver()));

  CountDownController _controller = CountDownController();

  int _counter = 3;
  double ballSize = 60;

  double xPos = 0;
  double yPos = 0;

  final player = AudioPlayer();

  void bubblePosition() {
    Random rnd = Random();
    int min = -100, max = 100;
    xPos = (rnd.nextInt(max - min) / 100) - 1;
    yPos = (rnd.nextInt(max - min) / 100) - 1;
  }

  void _startSound() async {
    player.setAsset('lib/assets/sounds/start-game-sound.mp3');
    player.setSpeed(0.75);
    player.play();
  }

  @override
  void initState() {
    super.initState();
    _startSound();
  }

  int score = 0;
  void changePosition() {
    setState(() {
      bubblePosition();
      score++;
      if (score < 10) {
        ballSize = ballSize;
      } else if (score < 20) {
        ballSize = 55;
      } else if (score < 30) {
        ballSize = 50;
      } else if (score < 40) {
        ballSize = 45;
      } else if (score < 50) {
        ballSize = 40;
      } else {
        ballSize = 35;
      }

      _controller.restart(duration: 3);
      player.setAsset('lib/assets/sounds/dong-sound.mp3');
      player.setSpeed(2.0);
      player.play();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Container(
            color: Colors.blueGrey[50],
            alignment: const Alignment(0.9, -1),
            child: Text(
              "Puanın: " + score.toString(),
              style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            alignment: Alignment(xPos, yPos),
            child: Container(
              width: ballSize,
              height: ballSize,
              decoration: BoxDecoration(
                color: Colors.yellowAccent,
                borderRadius: BorderRadius.circular(1000),
              ),
              child: InkWell(
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                focusColor: Colors.transparent,
                onTap: changePosition,
                child: CircularCountDownTimer(
                  duration: _counter,
                  initialDuration: 0,
                  controller: _controller,
                  width: ballSize,
                  height: ballSize,
                  ringColor: Colors.grey,
                  ringGradient: null,
                  fillColor: Colors.purpleAccent,
                  fillGradient: null,
                  backgroundColor: Colors.purple[500],
                  backgroundGradient: null,
                  strokeWidth: 5.0,
                  strokeCap: StrokeCap.round,
                  textStyle: TextStyle(
                      fontSize: 33.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  textFormat: CountdownTextFormat.S,
                  isReverse: true,
                  isReverseAnimation: true,
                  isTimerTextShown: true,
                  autoStart: true,
                  onStart: () {
                    //print('Countdown Started');
                  },
                  onComplete: () {
                    player.setAsset('lib/assets/sounds/game-over-sound.mp3');
                    player.setSpeed(2.0);
                    player.play();
                    //print('Countdown Ended');
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                GameOver(scoreCount: score.toString())));
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
