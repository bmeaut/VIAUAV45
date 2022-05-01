import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  var _emailValid = true;
  var _passwordValid = true;

  Future<void> _tryLogin(BuildContext context) async {
    final email = _emailController.text;
    final password = _passwordController.text;
    final analytics = Provider.of<FirebaseAnalytics>(context, listen: false);

    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      print("Logging in...");

      analytics.logLogin();

      Navigator.pushReplacementNamed(context, "/posts");
    } on Exception catch (e) {
      print("Login failed: ${e.toString()}");
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Login failed, please try again!")));
    }
  }

  Future<void> _tryRegistration(BuildContext context) async {
    final email = _emailController.text;
    final password = _passwordController.text;
    final analytics = Provider.of<FirebaseAnalytics>(context, listen: false);

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      analytics.logSignUp(signUpMethod: "email");

      print("User registration successful! Logging in...");

      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      analytics.logLogin();

      Navigator.pushReplacementNamed(context, "/posts");
    } on Exception catch (e) {
      print("User registration/login failed: ${e.toString()}");
      analytics.logEvent(name: "registration_failed");
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Registration failed, please try again!")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FlutterForum"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.forum,
                      color: Colors.orange,
                      size: 120,
                    ),
                  ],
                ),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    alignLabelWithHint: true,
                    labelText: "Email address",
                    errorText: _emailValid
                        ? null
                        : "Please provide a valid email address",
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    alignLabelWithHint: true,
                    labelText: "Password",
                    errorText: _passwordValid
                        ? null
                        : "The given password is invalid or not strong enough",
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            _tryLogin(context);
                          },
                          child: Text("Login".toUpperCase()),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            _tryRegistration(context);
                          },
                          child: Text("Register".toUpperCase()),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
