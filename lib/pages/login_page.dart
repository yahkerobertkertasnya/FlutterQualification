import 'package:flutter/material.dart';
import 'package:post_training_qualif/pages/home_page.dart';
import 'dart:io';

import 'package:post_training_qualif/pages/main_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String? usernameError;
  String? passwordError;

  void handleLogin() {
    usernameError = null;
    passwordError = null;

    String username = usernameController.text;
    String password = passwordController.text;


    if(username.isEmpty) {
      return setState(() {
        usernameError = "Username cannot be empty";
      });
    } 
    if (password.isEmpty) {
      return setState(() {
        passwordError = "Password cannot be empty";
      });
    } 
    else if (password.length < 8) {
      return setState(() {
        passwordError = "Password must be at least 8 characters";
      });
    }
    else if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(password)) {
      return setState(() {
        passwordError = "Password must be alphanumeric";
      });
    }

    Navigator.pushAndRemoveUntil(
      context, 
      MaterialPageRoute(builder: (context) {
        return MainPage(username: username);
      }),
      (route) => false
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      '/login/logo.jpg',
                      width: 100,
                      height: 100,
                    ),
                  ),
                  Container(
                    width: 10,
                  ),
                  const Text(
                    "Fate/Grand Order",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    hintText: "Username",
                    labelText: "Username",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    errorText: usernameError,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Password",
                      labelText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      errorText: passwordError),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                width: 250,
                height: 40,
                child:
                    FilledButton(onPressed: () {
                      handleLogin();
                    }, child: const Text("Login")),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
