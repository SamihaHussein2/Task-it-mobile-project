import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/components/custom_colors.dart';
import '/screens/Intro/appbar_register.dart';
import '/spalsh.dart';
import '/screens/Intro/signup.dart';
import '/screens/Intro/welcome_page.dart';

class login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset:
            false, // to pervent bottom overflowed when the keyboard appears
        backgroundColor: Colors.white,
        appBar: register_appbar(
          appBar: AppBar(),
          title: "Login",
        ),
        body: Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            children: [
              //Padding(padding: EdgeInsets.only(top: 5)),
              SizedBox(
                height: 20,
              ),
              Image.asset(
                "assets/logo/logo-final.png",
                height: 150,
                width: 300,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                    child: Column(
                      children: [
                        TextFormField(
                          //maxLength: 20,
                          decoration: InputDecoration(
                            labelText: "Email",
                            fillColor: Color(0xff2179ae),
                            prefixIcon: Icon(
                              Icons.email_sharp,
                              color: CustomColors.Midnight,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: CustomColors.YellowOrange),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          //maxLength: 20,
                          decoration: InputDecoration(
                            labelText: "Password",
                            prefixIcon: Icon(
                              Icons.password,
                              color: CustomColors.Midnight,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: CustomColors.YellowOrange),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        MaterialButton(
                          minWidth: 300, //badal el width fl material app
                          height: 60,
                          color: CustomColors.YellowOrange,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    //after validation goes to homepage
                                    builder: (context) => login()));
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
                              color: CustomColors.Midnight,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have an account?"),
                            RichText(
                              // richText to make the "skip" clickable and goes to homepage
                              text: TextSpan(
                                text: "Sign up",
                                style: TextStyle(
                                  color: CustomColors.Midnight,
                                  fontWeight: FontWeight.bold,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => signup()));
                                  },
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
