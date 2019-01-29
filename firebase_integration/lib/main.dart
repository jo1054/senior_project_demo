import 'package:flutter/material.dart';
//import 'package:flutter_app/pages/setup/welcome.dart';
//import 'package:flutter_app/pages/setup/welcome.dart';
import 'package:firebase_integration/pages/setup/welcome.dart';

void main()=> runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      title: 'Firebase Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: WelcomePage(),
    );
  }
}


