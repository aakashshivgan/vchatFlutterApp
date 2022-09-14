import 'package:flutter/material.dart';
import 'package:vechat/services/auth_services.dart';
import 'package:vechat/widgets/widgets.dart';
import 'package:vechat/pages/auth/login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthServices authServices = AuthServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: ElevatedButton(
                onPressed: () {
                  authServices.signOut();
                  nextScreen(context, const LoginPage());
                },
                child: const Text("logout"))));
  }
}
