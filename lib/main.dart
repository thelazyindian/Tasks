import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks/application/home/home_bloc.dart';
import 'package:tasks/pages/home/home_page.dart';
import 'package:tasks/pages/new_list/new_list_page.dart';
import 'package:tasks/pages/splash/splash_page.dart';

void main() {
  final systemUiOverlayStyle = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark,
    systemNavigationBarDividerColor: Colors.grey.shade300,
  );
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('assets/google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tasks',
        theme: ThemeData(
          dividerColor: Colors.grey.shade300,
          primaryColor: Colors.white,
          accentColor: Colors.blue,
          backgroundColor: Colors.white,
          scaffoldBackgroundColor: Colors.white,
          dialogBackgroundColor: Colors.white,
          textTheme: GoogleFonts.notoSansTextTheme(),
        ),
        home: SplashPage(),
        routes: {
          '/home': (_) => HomePage(),
          '/newList': (_) => NewListPage(),
        },
      ),
    );
  }
}
