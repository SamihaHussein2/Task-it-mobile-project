import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_it/screens/Intro/appbar_register.dart';
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
        appBar: register_appbar(appBar: AppBar()),
        body: Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Column(children: [
              //Padding(padding: EdgeInsets.only(top: 5)),
              SizedBox(
                height: 0,
              ),
              Image.asset(
                "assets/logo/logo-final.png",
                height: 80,
                width: 300,
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  child: Column(
                    children: [
                      TextFormField(
                        //maxLength: 20,
                        decoration: InputDecoration(
                          labelText: "Full Name",
                          fillColor: Color(0xff2179ae),
                          prefixIcon: Icon(
                            Icons.person,
                            color: Color(0xff2179ae),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffee3f23)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        //maxLength: 20,
                        decoration: InputDecoration(
                          labelText: "Email",
                          prefixIcon: Icon(
                            Icons.email_sharp,
                            color: Color(0xff2179ae),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffee3f23)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        maxLength: 8,
                        decoration: InputDecoration(
                          labelText: "Password",
                          prefixIcon: Icon(
                            Icons.password,
                            color: Color(0xff2179ae),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffee3f23)),
                          ),
                        ),
                      ),
                      TextFormField(
                        maxLength: 8,
                        decoration: InputDecoration(
                          labelText: "Confirm Password",
                          prefixIcon: Icon(
                            Icons.password,
                            color: Color(0xff2179ae),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffee3f23)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      MaterialButton(
                        minWidth: 300, //badal el width fl material app
                        height: 60,
                        color: const Color(0xffee3f23),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => login()));
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
                            color: Colors.white,
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
                                color: Colors.black,
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
                )
              ])
            ])));
  }
}
