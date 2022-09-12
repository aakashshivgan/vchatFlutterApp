import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:vechat/pages/auth/register_page.dart';
import 'package:vechat/shared/constants.dart';
import 'package:vechat/widgets/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
            child: Form(
              key: formKey,
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
                      "Login now to see what they are talking!",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                    ),
                    Image.asset("assets/register.png"),
                    const SizedBox(
                      height: 20,
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
                        onPressed: () {
                          login();
                        },
                        child: const Text(
                          "Login In",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text.rich(TextSpan(
                      text: "Don't have an account ? ",
                      style: const TextStyle(color: Colors.black, fontSize: 14),
                      children: <TextSpan>[
                        TextSpan(
                            text: "Register here",
                            style: const TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                nextScreen(context, const RegisterPage());
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

  login() {}
}
