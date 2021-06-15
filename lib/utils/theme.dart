import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

final bottomSheetShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
    topLeft: const Radius.circular(8.0),
    topRight: const Radius.circular(8.0),
  ),
);

final primaryColorLight = Colors.white;
final primaryColorDark = Color(0xFF121212);
final secondaryColorDark = Color(0xFF27242C);

final lightTheme = ThemeData.light().copyWith(
  dividerColor: Colors.grey.shade300,
  primaryColor: primaryColorLight,
  accentColor: Colors.blue,
  iconTheme: IconThemeData(color: Colors.grey.shade600),
  backgroundColor: primaryColorLight,
  scaffoldBackgroundColor: primaryColorLight,
  dialogBackgroundColor: primaryColorLight,
  bottomAppBarColor: primaryColorLight,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: primaryColorLight,
  ),
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: primaryColorLight,
    shape: bottomSheetShape,
  ),
  textTheme: GoogleFonts.notoSansTextTheme().apply(
    displayColor: primaryColorDark,
    bodyColor: primaryColorDark,
  ),
);

final darkTheme = ThemeData.dark().copyWith(
  dividerColor: Colors.grey.shade300,
  primaryColor: primaryColorDark,
  accentColor: Colors.blue,
  iconTheme: IconThemeData(color: Colors.white54),
  backgroundColor: primaryColorDark,
  scaffoldBackgroundColor: primaryColorDark,
  dialogBackgroundColor: primaryColorDark,
  bottomAppBarColor: secondaryColorDark,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: secondaryColorDark,
  ),
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: secondaryColorDark,
    shape: bottomSheetShape,
  ),
  textTheme: GoogleFonts.notoSansTextTheme().apply(
    displayColor: primaryColorLight,
    bodyColor: primaryColorLight,
  ),
);

final systemUiOverlayStyleLight = SystemUiOverlayStyle(
  statusBarColor: Colors.transparent,
  statusBarIconBrightness: Brightness.dark,
  systemNavigationBarColor: Colors.white,
  systemNavigationBarIconBrightness: Brightness.dark,
  systemNavigationBarDividerColor: Colors.transparent,
);

final systemUiOverlayStyleDark = SystemUiOverlayStyle(
  statusBarColor: Colors.transparent,
  statusBarIconBrightness: Brightness.light,
  systemNavigationBarColor: secondaryColorDark,
  systemNavigationBarIconBrightness: Brightness.light,
  systemNavigationBarDividerColor: Colors.transparent,
);
