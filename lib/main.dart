import 'package:flutter/material.dart';
import 'package:tasks/pages/splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tasks',
      theme: ThemeData(
        dividerColor: Colors.grey[300],
        primarySwatch: Colors.blue,
        canvasColor: Colors.transparent,
        backgroundColor: Colors.white,
        dialogBackgroundColor: Colors.white,
        fontFamily: 'Raleway',
      ),
      home: SplashPage(),
    );
  }
}
