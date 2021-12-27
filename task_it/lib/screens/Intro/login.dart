import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/components/custom_colors.dart';
import 'appbar_register.dart';
import '/spalsh.dart';
import 'signup.dart';
import '/screens/Intro/welcome_page.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _pass = GlobalKey<FormState>();
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
                height: 10,
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
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return 'Please enter email';
                              }
                              return null;
                            },

                            //maxLength: 20,
                            decoration: InputDecoration(
                              labelText: "Email",
                              fillColor: Color(0xff2179ae),
                              prefixIcon: Icon(
                                Icons.email_sharp,
                                color: CustomColors.Midnight,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: CustomColors.YellowOrange),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            key: _pass,
                            validator: (val2) {
                              if (val2 == null || val2.isEmpty) {
                                return 'Please enter password';
                              }
                              return null;
                            },
                            //maxLength: 20,
                            decoration: InputDecoration(
                              labelText: "Password",
                              prefixIcon: Icon(
                                Icons.password,
                                color: CustomColors.Midnight,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: CustomColors.YellowOrange),
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
                              if (_formKey.currentState!.validate() &&
                                  _pass.currentState!.validate()) {
                                // If the form is valid, display a snackbar. In the real world,
                                // you'd often call a server or save the information in a database.
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        //after validation goes to homepage
                                        builder: (context) => Login()));
                              }
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
                                              builder: (context) => Signup()));
                                    },
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
