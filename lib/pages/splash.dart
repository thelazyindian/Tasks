import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tasks/pages/home_page.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 1),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) {
          return TasksHomePage();
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Center(
            child: Image(
              width: 150.0,
              height: 150.0,
              image: AssetImage("assets/images/icon.png"),
            ),
          ),
          Positioned(
            left: .0,
            right: .0,
            bottom: 30.0,
            child: Text(
              "#TeamCardinal",
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
                letterSpacing: 1.0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
