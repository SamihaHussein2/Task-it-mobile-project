import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '/constants/custom_colors.dart';
import '/screens/Intro/login.dart';
import '/screens/Intro/signup.dart';
import '/screens/user_account.dart';
import '/spalsh.dart';
import '/screens/homepage/homepage.dart';
// ignore_for_file: file_names

class welcomepage extends StatelessWidget {
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
                          color: CustomColors.Midnight),
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
                    //margin: EdgeInsets.only(left: 0),
                    child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      //space between image and text (badal el sizedBox)
                      padding: EdgeInsets.all(25),
                    ),
                    Image.asset(
                      "assets/logo/logo-final.png",
                      width: 170,
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
                      color: CustomColors.YellowOrange,
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login()));
                      },
                      //define shape el button
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.white,
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
                      height: 20,
                    ),
                    MaterialButton(
                      minWidth: 300, //badal el width fl material app
                      height: 60,
                      color: CustomColors.Midnight,
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Signup()));
                      },
                      //define shape el button
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.white,
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
                                    builder: (context) => Homepage()));
                          },
                      ),
                    )
                  ],
                )
              ],
            )));
  }
}
