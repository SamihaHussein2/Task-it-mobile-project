import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_it/screens/navscreens/homepage/homepage.dart';
import '/screens/Intro/welcome_page.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _checkpages() {
    final firebaseUser = context.watch<User?>();

    if (firebaseUser != null) {
      return Homepage();
    }
    return welcomepage();
  }

  _navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 2500), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => welcomepage()));
  }

  @override
  Widget build(BuildContext context) {
    _checkpages();
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
                  "assets/logo/OUR-LOGO.png",
                  width: 70,
                  height: 70,
                ),
              ],
            )));
  }
}
