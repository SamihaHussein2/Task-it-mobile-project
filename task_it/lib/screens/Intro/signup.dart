import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_it/components/custom_colors.dart';
import 'package:task_it/components/appbar_register.dart';
import 'package:task_it/screens/Intro/login.dart';
import 'package:task_it/screens/Intro/welcome_page.dart';

class signup extends StatelessWidget {
  const signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:
          false, // to pervent bottom overflowed when the keyboard appears
      backgroundColor: Colors.white,
      appBar: register_appbar(
        appBar: AppBar(),
        title: "Sign up",
      ),
      body: signupform(),
    );
  }
}

class signupform extends StatefulWidget {
  signupform({Key? key}) : super(key: key);

  @override
  _signupformState createState() => _signupformState();
}

class _signupformState extends State<signupform> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(children: [
          //Padding(padding: EdgeInsets.only(top: 5)),
          SizedBox(
            height: 0,
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          //maxLength: 20,
                          autofocus: true,
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: "Full Name",
                            fillColor: Color(0xff2179ae),
                            prefixIcon: Icon(
                              Icons.person,
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
                          autofocus: true,
                          validator: (val2) {
                            if (val2 == null || val2.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: "Email",
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
                          maxLength: 8,
                          autofocus: true,
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
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
                        TextFormField(
                          maxLength: 8,
                          autofocus: true,
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: "Confirm Password",
                            prefixIcon: Icon(
                              Icons.password,
                              color: CustomColors.Midnight,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              //borderRadius: BorderRadius.circular(5),
                              borderSide:
                                  BorderSide(color: CustomColors.YellowOrange),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        MaterialButton(
                          minWidth: 300, //badal el width fl material app
                          height: 40,
                          color: CustomColors.YellowOrange,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // If the form is valid, display a snackbar. In the real world,
                              // you'd often call a server or save the information in a database.
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Processing Data')),
                              );
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => login()));
                            }
                          },
                          //define shape el button
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(50)),
                          child: Text(
                            "Sign Up",
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
                            Text("Already have an account?"),
                            RichText(
                              // richText to make the "skip" clickable and goes to homepage
                              text: TextSpan(
                                text: " Login",
                                style: TextStyle(
                                  color: CustomColors.Midnight,
                                  fontWeight: FontWeight.bold,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            //change page to the homepage
                                            builder: (context) => login()));
                                  },
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ))
            ],
          )
        ]));
  }
}
