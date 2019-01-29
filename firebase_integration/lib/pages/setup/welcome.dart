import 'package:flutter/material.dart';
//import 'package:flutter_app/pages/setup/signin.dart';
//import 'package:flutter_app/pages/setup/signup.dart';
import 'package:firebase_integration/pages/setup/signin.dart';
import 'package:firebase_integration/pages/setup/signup.dart';
class  WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My firebase app'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RaisedButton(
            onPressed: navigateToSignIn,
            child: Text('Sign in'),
          ),
          RaisedButton(
            onPressed: navigateToSignUp,
            child: Text('Sign up'),
          )
        ],
      )
    );
  }
  void navigateToSignIn(){
    Navigator.push(context,MaterialPageRoute(builder:(context)=>LoginPage(),fullscreenDialog: true));
  }
  void navigateToSignUp(){
    Navigator.push(context,MaterialPageRoute(builder:(context)=>SignUpPage(),fullscreenDialog: true));
  }
}
