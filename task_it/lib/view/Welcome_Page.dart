import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_it/view/Login.dart';
import 'package:task_it/view/SignUp.dart';
import 'package:task_it/spalsh.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: double.infinity,
            //height: MediaQuery.of(context).size.height,
            child: ListView(
              //mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      "Welcome",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: const Color(0xffee3f23)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Get all your tasks done or as we say Task it!!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          //fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: Colors.grey[700]),
                    ),
                  ],
                ),
                Container(
                    //space 3shan tozbot el image fl center
                    margin: EdgeInsets.only(left: 20),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          //space between image and text (badal el sizedBox)
                          padding: EdgeInsets.all(25),
                        ),
                        Image.asset(
                          "assets/logo/task-WP.png",
                          width: 150,
                        )
                      ],
                    )),
                Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    MaterialButton(
                      minWidth: 300, //badal el width fl material app
                      height: 60,
                      color: const Color(0xffee3f23),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignUp()));
                      },
                      //define shape el button
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(50)),

                      child: Text(
                        "Get Started",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    MaterialButton(
                      minWidth: 300, //badal el width fl material app
                      height: 60,
                      //color: const Color(0xffee3f23),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      },
                      //define shape el button
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(50)),
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RichText(
                      // richText to make the "skip" clickable and goes to homepage
                      text: TextSpan(
                        text: "Skip",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    //change page to the homepage
                                    builder: (context) => Splash()));
                          },
                      ),
                    )
                  ],
                )
              ],
            )));
  }
}
