// ignore_for_file: non_constant_identifier_names

import 'dart:math';
import 'package:bubbles_pop/game_over.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:confetti/confetti.dart';

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

  late ConfettiController _controllerCenter;

  CountDownController _controller = CountDownController();

  int _counter = 4;
  double ballSize = 60;

  double xPos = 0;
  double yPos = 0;

  final player = AudioPlayer();

  void bubblePosition() {
    Random rnd = Random();
    int minX = -98, maxX = 98, minY = -90, maxY = 90;
    xPos = (rnd.nextInt(maxX - minX) / 100) - 0.98;
    yPos = (rnd.nextInt(maxY - minY) / 100) - 0.9;
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
    _controllerCenter =
        ConfettiController(duration: const Duration(milliseconds: 10));
  }

  @override
  void dispose() {
    _controllerCenter.dispose();
    super.dispose();
  }

  int score = 0;
  void changePosition() {
    setState(() {
      _controllerCenter.play();
      bubblePosition();
      score++;
      if (score < 10) {
        ballSize = ballSize;
      } else if (score < 20) {
        ballSize = 55;
        _counter = 3;
      } else if (score < 30) {
        ballSize = 50;
      } else if (score < 40) {
        ballSize = 45;
        _counter = 2;
      } else if (score < 50) {
        ballSize = 40;
      } else {
        ballSize = 35;
        _counter = 1;
      }

      _controller.restart(duration: _counter);
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
            color: Color(0xFFF0EEE1),
            alignment: const Alignment(0.95, -0.98),
            child: FittedBox(
              child: Container(
                padding: const EdgeInsets.fromLTRB(5, 1, 5, 1),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color(0xFF151B2B),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      'lib/assets/images/score-icon.png',
                      width: 25,
                    ),
                    SizedBox(width: 5),
                    Text(
                      score.toString(),
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.amber),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment(xPos, yPos),
            child: ConfettiWidget(
              confettiController: _controllerCenter,
              blastDirectionality: BlastDirectionality
                  .explosive, // don't specify a direction, blast randomly
              maxBlastForce: 5, // set a lower max blast force
              minBlastForce: 2, // set a lower min blast force
              emissionFrequency: 1,
              numberOfParticles: 15,
              //gravity: 0.005, // gravity - or fall speed
              shouldLoop: false,
              colors: const [
                Colors.green,
                Colors.blue,
                Colors.pink,
                Colors.orange,
                Colors.purple
              ], // manually specify the colors to be used
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
                  fillColor: Color(0xFF151B2B),
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
                  isTimerTextShown: false,
                  autoStart: true,
                  onStart: () {
                    //print('Countdown Started');
                  },
                  onComplete: () {
                    _controllerCenter.play();
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
