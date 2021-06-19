import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tasks/application/home/home_bloc.dart';
import 'package:tasks/application/theme/theme_cubit.dart';
import 'package:tasks/models/sort_by.dart';
import 'package:tasks/models/sub_task.dart';
import 'package:tasks/models/task.dart';
import 'package:tasks/models/tlist.dart';
import 'package:tasks/utils/time_of_day_converter.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Hive.initFlutter().then(
      (_) {
        Hive.registerAdapter(TlistAdapter());
        Hive.registerAdapter(TaskAdapter());
        Hive.registerAdapter(SubTaskAdapter());
        Hive.registerAdapter(SortByAdapter());
        Hive.registerAdapter(TimeOfDayAdapter());

        Hive.openBox('settings').then((_) {
          context.read<ThemeCubit>().started();
          context.read<HomeBloc>().add(HomeEvent.started());
          Future.delayed(Duration(seconds: 1)).then(
            (_) => Navigator.of(context).pushReplacementNamed('/home'),
          );
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Center(
            child: Image.asset(
              'assets/images/icon.png',
              width: 150.0,
              height: 150.0,
            ),
          ),
          Positioned(
            left: .0,
            right: .0,
            bottom: 80.0,
            child: Text(
              "#TeamCardinal",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 28.0,
                letterSpacing: 1.0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
