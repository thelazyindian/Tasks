import 'dart:async';

import 'package:flutter/material.dart';

import '../pages/home_page.dart';

class TasksSplashPage extends StatefulWidget {
  @override
  _TasksSplashPageState createState() => _TasksSplashPageState();
}

class _TasksSplashPageState extends State<TasksSplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pop(context);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) {
          return TasksHomePage();
        }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            color: Colors.white,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                width: 150.0,
                height: 150.0,
                image: AssetImage("assets/images/icon.png"),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 30.0),
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
        ],
      ),
    );
  }
}
