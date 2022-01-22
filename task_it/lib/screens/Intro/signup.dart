import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_it/provider/Auth_service.dart';
import '/constants/custom_colors.dart';
import '/screens/Intro/appbar_register.dart';
import '/screens/Intro/login.dart';
import 'package:email_validator/email_validator.dart';

class Signup extends StatelessWidget {
  const Signup({Key? key}) : super(key: key);

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
      body: const Signupform(),
    );
  }
}

class Signupform extends StatefulWidget {
  const Signupform({Key? key}) : super(key: key);

  @override
  _SignupformState createState() => _SignupformState();
}

class _SignupformState extends State<Signupform> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirm = TextEditingController();

  bool show = true; //Button show password or hashed
  bool showConfirm = true; //Button (confirm) show password or hashed

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(children: [
          //Padding(padding: EdgeInsets.only(top: 5)),
          const SizedBox(
            height: 0,
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        // TextFormField(
                        //   //maxLength: 20,
                        //   autofocus: true,
                        //   validator: (val) {
                        //     if (val == null || val.isEmpty) {
                        //       return 'Please enter some text';
                        //     }
                        //     return null;
                        //   },
                        //   decoration: InputDecoration(
                        //     labelText: "Full Name",
                        //     fillColor: Color(0xff2179ae),
                        //     prefixIcon: Icon(
                        //       Icons.person,
                        //       color: CustomColors.Midnight,
                        //     ),
                        //     enabledBorder: UnderlineInputBorder(
                        //       borderSide:
                        //           BorderSide(color: CustomColors.YellowOrange),
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        // Image.asset(
                        //   "assets/logo/logo-final.png",
                        //   height: 140,
                        //   width: 100,
                        // ),
                        TextFormField(
                          controller: email,
                          autofocus: true,
                          validator: (val_email) {
                            if (val_email == null || val_email.isEmpty) {
                              return 'Please enter some text';
                            } else if (EmailValidator.validate(val_email) ==
                                false) {
                              return 'Please Enter valid email';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: "Email",
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
                          obscureText: show,
                          controller: password,
                          // autovalidateMode: AutovalidateMode.onUserInteraction,
                          autofocus: true,
                          validator: (val_pass) {
                            if (val_pass == null || val_pass.isEmpty) {
                              return 'Please enter some text';
                            }
                            if (val_pass.length < 8) {
                              return 'Password has to be at least 8 characters';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            suffix: IconButton(
                                onPressed: () {
                                  setState(() {
                                    //refresh UI
                                    if (show) {
                                      show = false;
                                    } else {
                                      show = true;
                                    }
                                  });
                                },
                                icon: Icon(show == true
                                    ? Icons.remove_red_eye
                                    : Icons.password)),
                            labelText: "Password",
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: CustomColors.YellowOrange),
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: confirm,
                          //maxLength: 8,
                          obscureText: showConfirm,
                          autofocus: true,
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'Please enter some text';
                            }
                            if (val.length < 8) {
                              return 'Please enter strong password';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            suffix: IconButton(
                                onPressed: () {
                                  setState(() {
                                    //refresh UI
                                    if (showConfirm) {
                                      showConfirm = false;
                                    } else {
                                      showConfirm = true;
                                    }
                                  });
                                },
                                icon: Icon(showConfirm == true
                                    ? Icons.remove_red_eye
                                    : Icons.password)),
                            labelText: "Confirm Password",
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
                          color: Color.fromRGBO(255, 177, 86, 1),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              if (confirm.text == password.text) {
                                final check = await context
                                    .read<AuthenticationService>()
                                    .signUp(
                                      email.text.trim(),
                                      password.text.trim(),
                                    );
                                print(check.toString());
                                final snackBar = SnackBar(
                                  content: Text(check.toString()),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);

                                if (check.toString() == "Signed Up") {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Login()));
                                }
                              } else {
                                Scaffold.of(context).showSnackBar(new SnackBar(
                                    content:
                                        new Text("Password is Unmatched")));
                              }
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
                                            builder: (context) => Login()));
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
