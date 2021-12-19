import 'package:flutter/material.dart';
import '/screens/Intro/welcome_page.dart';

class Splash extends StatefulWidget {
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 2500), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => welcomepage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                SizedBox(
                  height: 200,
                ),
                TweenAnimationBuilder(
                  duration: Duration(seconds: 1),
                  tween: Tween<double>(begin: 0, end: 2 * 3.14),
                  builder: (_, double angle, __) {
                    return Transform.rotate(
                        angle: angle,
                        child: Image.asset(
                          "assets/logo/logo-final.png",
                          width: 300,
                          height: 200,
                        ));
                  },
                ),
                SizedBox(
                  height: 100,
                ),
                Image.asset(
                  "assets/logo/logo-final.png",
                  width: 70,
                  height: 70,
                ),
              ],
            )));
  }
}
