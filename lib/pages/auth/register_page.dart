import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:vechat/pages/auth/login_page.dart';
import 'package:vechat/pages/home_page.dart';

import '../../shared/constants.dart';
import '../../widgets/widgets.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formkey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String fullname = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
            child: Form(
              key: formkey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Groupies",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Create your account now to chat and explore",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                    ),
                    Image.asset("assets/groupie.jpg"),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: textInputDecoration.copyWith(
                        labelText: "Full name",
                        prefixIcon: Icon(
                          Icons.person,
                          color: Constants().primaryColor,
                        ),
                      ),
                      onChanged: (val) {
                        setState(() {
                          fullname = val;
                        });
                      },
                      validator: ((val) {
                        if (val!.isNotEmpty) {
                          return null;
                        } else {
                          return "Name cannot be empty";
                        }
                      }),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                        decoration: textInputDecoration.copyWith(
                          labelText: "Email",
                          prefixIcon: Icon(
                            Icons.email_rounded,
                            color: Constants().primaryColor,
                          ),
                        ),
                        onChanged: (val) {
                          setState(() {
                            email = val;
                          });
                        },
                        validator: ((val) {
                          return RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(val!)
                              ? null
                              : "Please enter a valid email";
                        })),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: textInputDecoration.copyWith(
                        labelText: "Password",
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Constants().primaryColor,
                        ),
                      ),
                      obscureText: true,
                      onChanged: (val) {
                        setState(() {
                          password = val;
                        });
                      },
                      validator: (val) {
                        if (val!.length < 6) {
                          return "password must be atleast 6 characters";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).primaryColor,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        onPressed: () {},
                        child: const Text(
                          "Register ",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text.rich(TextSpan(
                      text: "Already have a account ! ",
                      style: const TextStyle(color: Colors.black, fontSize: 14),
                      children: <TextSpan>[
                        TextSpan(
                            text: "Login now",
                            style: const TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                nextScreen(context, const LoginPage());
                              }),
                      ],
                    )),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
