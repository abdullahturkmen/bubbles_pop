import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  void initState() {
    // TODO: implement initState
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Builder(builder: (context) {
          return Scaffold(
              body: Center(
            child: Stack(
              children: [
                Center(
                  child: Container(
                    alignment: Alignment(0, 0),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                            'lib/assets/images/splash-screen-gradient-bg.jpeg'),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    alignment: Alignment(0, 0),
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: const BoxDecoration(
                      color: Color(0xFFF0EEE1),
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      'lib/assets/images/bubbles-pop-logo.png',
                      width: MediaQuery.of(context).size.width * 0.4,
                    ),
                  ),
                ),
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
