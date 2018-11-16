import 'package:flutter/material.dart';

class MainListAppBar extends StatelessWidget {
  final String name;
  MainListAppBar({this.name});
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      expandedHeight: 85.0,
      floating: false,
      snap: false,
      elevation: 0.0,
      flexibleSpace: FlexibleSpaceBar(
        title: (name != "" && name != null)
            ? Text(
                name,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25.0,
                  fontWeight: FontWeight.w400,
                ),
              )
            : Text(""),
      ),
    );
  }
}
