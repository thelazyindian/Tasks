import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tasks/pages/home_page.dart';

class TasksSplashPage extends StatefulWidget {
  @override
  _TasksSplashPageState createState() => new _TasksSplashPageState();
}

class _TasksSplashPageState extends State<TasksSplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pop(context);
      Navigator.of(context).push(
        new MaterialPageRoute(builder: (BuildContext context) {
          return new TasksHomePage();
        }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Container(
            color: Colors.white,
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Image(
                width: 150.0,
                height: 150.0,
                image: new AssetImage("assets/images/icon.png"),
              ),
            ],
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              new Padding(
                padding: EdgeInsets.only(bottom: 30.0),
                child: new Text(
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
