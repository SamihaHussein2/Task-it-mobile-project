import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_it/provider/Auth_service.dart';
import 'package:task_it/screens/navscreens/homepage/homepage.dart';
import '/constants/custom_colors.dart';
import 'appbar_register.dart';
import 'signup.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _pass = GlobalKey<FormState>();

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  bool show = true; //Button show password or hashed

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
                            controller: email,
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return 'Please enter email';
                              } else if (EmailValidator.validate(val) ==
                                  false) {
                                return 'Please Enter valid email';
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
                            controller: password,
                            obscureText: show,
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
                            onPressed: () async {
                              //print(FirebaseAuth.instance.currentUser!.email);
                              if (_formKey.currentState!.validate()) {
                                //working with Auth_service
                                final check = await context
                                    .read<AuthenticationService>()
                                    .signIn(
                                      email.text.trim(),
                                      password.text.trim(),
                                    );

                                final snackBar = SnackBar(
                                  content: Text(check.toString()),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);

                                if (check.toString() == "Signed in") {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Homepage()));
                                }
                                //display error type in dialog window
                                // showDialog(
                                //   context: context,
                                //   builder: (BuildContext context) =>
                                //       _buildPopupDialog(
                                //           context, check.toString()),
                                // );

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

// Widget _buildPopupDialog(BuildContext context, String text) {
//   return new AlertDialog(
//     title: const Text('Popup example'),
//     content: new Column(
//       mainAxisSize: MainAxisSize.min,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Text(text),
//       ],
//     ),
//     actions: <Widget>[
//       new FlatButton(
//         onPressed: () {
//           Navigator.of(context).pop();
//         },
//         textColor: Theme.of(context).primaryColor,
//         child: const Text('Close'),
//       ),
//     ],
//   );
// }
