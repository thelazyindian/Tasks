import 'package:flutter/material.dart';
import 'animated_icon.dart';

class FancyFab extends StatefulWidget {
  final Function() onPressed;
  final String tooltip;
  final IconData icon;

  FancyFab({this.onPressed, this.tooltip, this.icon});

  @override
  _FancyFabState createState() => _FancyFabState();
}

class _FancyFabState extends State<FancyFab>
    with SingleTickerProviderStateMixin {
  bool isOpened = false;
  AnimationController _animationController;
  Animation<Color> _buttonColor;
  Animation<double> _animateIcon;
  Animation<double> _translateButton;
  Curve _curve = Curves.easeOut;
  double _fabHeight = 45.0;

  @override
  initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addListener(() {
            setState(() {});
          });
    _animateIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _buttonColor = ColorTween(
      begin: Colors.blue,
      end: Colors.red,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.00,
        1.00,
        curve: Curves.linear,
      ),
    ));
    _translateButton = Tween<double>(
      begin: _fabHeight,
      end: -14.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.0,
        0.75,
        curve: _curve,
      ),
    ));
    super.initState();
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  animate() {
    if (!isOpened) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    isOpened = !isOpened;
  }

  Widget details() {
    return Container(
      child: FloatingActionButton(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        mini: true,
        heroTag: "Details",
        onPressed: null,
        tooltip: 'Details',
        child: Icon(Icons.short_text, color: Colors.blue),
      ),
    );
  }

  Widget calendar() {
    return Container(
      child: FloatingActionButton(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        mini: true,
        heroTag: "Calendar",
        onPressed: null,
        tooltip: 'Add Date',
        child: Icon(
          Icons.event_available,
          color: Colors.blue,
        ),
      ),
    );
  }

  Widget toggle() {
    return Container(
      child: FloatingActionButton(
        elevation: 0.0,
        mini: true,
        heroTag: "Toggle",
        backgroundColor: Colors.white,
        onPressed: animate,
        tooltip: 'Toggle',
        child: HighLightedIcon(
          Icons.add_circle_outline,
          color: _buttonColor.value,
          secondIcon: Icons.close,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value * 2.0,
            0.0,
          ),
          child: calendar(),
        ),
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value,
            0.0,
          ),
          child: details(),
        ),
        toggle(),
      ],
    );
  }
}
