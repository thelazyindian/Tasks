import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/application/home/home_bloc.dart';
import 'package:tasks/pages/home/home_page.dart';
import 'package:tasks/pages/splash/splash_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => HomeBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tasks',
        theme: ThemeData(
          dividerColor: Colors.grey.shade300,
          primarySwatch: Colors.blue,
          canvasColor: Colors.transparent,
          backgroundColor: Colors.white,
          scaffoldBackgroundColor: Colors.white,
          dialogBackgroundColor: Colors.white,
          fontFamily: GoogleFonts.roboto().fontFamily,
        ),
        home: SplashPage(),
        routes: {
          '/home': (_) => HomePage(),
        },
      ),
    );
  }
}
