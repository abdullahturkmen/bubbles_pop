// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'dart:math';
import 'package:bubbles_pop/game_over.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:just_audio/just_audio.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:confetti/confetti.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  final CountDownController _controller = CountDownController();

  Color start_color = Color(0xFFF0EEE1);

  changeBackground() {
    Color color = Color.fromARGB(150, Random().nextInt(256),
        Random().nextInt(256), Random().nextInt(256));
    setState(() {
      start_color = color;
    });
  }

  int health = 3;
  bool volume = true;
  int score = 0;
  int _counter = 4;
  double ballSize = 60;
  bool beforeStarted = true;

  double xPos = 0;
  double yPos = -0.3;

  final player = AudioPlayer();

  void bubblePosition() {
    Random rnd = Random();
    int minX = -98, maxX = 98, minY = -90, maxY = 90;
    xPos = (rnd.nextInt(maxX - minX) / 100) - 0.98;
    yPos = (rnd.nextInt(maxY - minY) / 100) - 0.9;
  }

  changeBallSize() {
    ballSize = Random().nextInt(50) + 35;
  }

  _getVolumeSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    volume = prefs.getBool('volume') ?? true;

    if (volume == true) {
      player.setVolume(1);
      //await prefs.setBool('volume', false);
      //volume = false;
    } else {
      player.setVolume(0);
      //await prefs.setBool('volume', true);
      //volume = true;
    }

    setState(() {});

    return volume = prefs.getBool('volume') ?? true;
  }

  void _startSound() async {
    player.setAsset('lib/assets/sounds/start-game-sound.mp3');
    player.setSpeed(0.75);
    player.play();
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _getVolumeSettings();
    });

    _startSound();
    _controllerCenter =
        ConfettiController(duration: const Duration(milliseconds: 10));
  }

  @override
  void dispose() {
    _controllerCenter.dispose();
    super.dispose();
  }

  void changePosition() {
    setState(() {
      beforeStarted = false;
      _controllerCenter.play();
      bubblePosition();
      score++;
      if (score < 15) {
        ballSize = ballSize;
      } else if (score < 30) {
        ballSize = 57;
        _counter = 3;
      } else if (score < 45) {
        ballSize = 54;
      } else if (score < 60) {
        ballSize = 51;
      } else if (score < 75) {
        ballSize = 48;
      } else if (score < 90) {
        ballSize = 45;
        _counter = 2;
      } else if (score < 105) {
        ballSize = 45;
      } else {
        ballSize = 42;
        _counter = 1;
      }

      if (score % 100 == 0) {
        changeBackground();
      }

      if (score > 150) {
        changeBallSize();
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
            color: start_color,
            alignment: const Alignment(0.95, -0.98),
            child: FittedBox(
              child: Container(
                padding: const EdgeInsets.fromLTRB(5, 1, 5, 1),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color(0xFF151B2B),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.health_and_safety_rounded,
                      color: Colors.blue.shade400,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      health.toString(),
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.blue),
                    ),
                    const SizedBox(width: 5),
                    Image.asset(
                      'lib/assets/images/score-icon.png',
                      width: 20,
                    ),
                    const SizedBox(width: 5),
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
                  fillColor: Colors.redAccent,
                  fillGradient: null,
                  backgroundColor: const Color(0xFF151B2B),
                  backgroundGradient: null,
                  strokeWidth: 5.0,
                  strokeCap: StrokeCap.round,
                  textStyle: const TextStyle(
                      fontSize: 33.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  textFormat: CountdownTextFormat.S,
                  isReverse: true,
                  isReverseAnimation: true,
                  isTimerTextShown: false,
                  autoStart: false,
                  onStart: () {
                    //print('Countdown Started');
                  },
                  onComplete: () {
                    _controllerCenter.play();
                    player.setAsset('lib/assets/sounds/game-over-sound.mp3');
                    player.setSpeed(2.0);
                    player.play();
                    //print('Countdown Ended');

                    if (health > 1) {
                      changePosition;
                      setState(() {
                        health--;
                        xPos = 0;
                        yPos = -0.3;
                        beforeStarted = true;
                      });
                    } else {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  GameOver(scoreCount: score)));
                    }
                  },
                ),
              ),
            ),
          ),
          Container(
            alignment: const Alignment(0, 0.4),
            child: getBeforeStartedWidget(),
          ),
        ],
      ),
    );
  }

  getBeforeStartedWidget() {
    return beforeStarted == true
        ? Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'lib/assets/images/hand-click-icon.png',
                width: MediaQuery.of(context).size.width * 0.4,
              ),
              SizedBox(height: 30),
              const Text(
                "Hazır olduğunuzda balona tıklayın!",
                style: TextStyle(
                    color: Color(0xFFFF6600),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )
            ],
          )
        : null;
  }
}
