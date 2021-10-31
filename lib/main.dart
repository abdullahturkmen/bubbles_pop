import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'home.dart';



void main() {
  //SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(const SplashPage());
}

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Builder(builder: (context) {
          return Scaffold(
              body: Center(
            child: Stack(
              children: [
                Image.asset('lib/assets/images/splash-screen-img.gif'),
                CircularCountDownTimer(
                  duration: 3,
                  initialDuration: 0,
                  controller: CountDownController(),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  ringColor: Colors.transparent,
                  ringGradient: null,
                  fillColor: Colors.transparent,
                  fillGradient: null,
                  backgroundColor: null,
                  backgroundGradient: null,
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
                    //print('Countdown Ended');
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => StartGame()));
                  },
                ),
              ],
            ),
          ));
        }));
  }
}
