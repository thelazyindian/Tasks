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
  appBarTheme: AppBarTheme(
    backgroundColor: primaryColorLight,
    brightness: Brightness.light,
    iconTheme: IconThemeData(
      color: Colors.grey.shade700,
    ),
    actionsIconTheme: IconThemeData(
      color: Colors.grey.shade700,
    ),
  ),
  primaryColor: primaryColorLight,
  accentColor: Colors.blue,
  canvasColor: Colors.grey.shade300,
  iconTheme: IconThemeData(color: Colors.grey.shade600),
  primaryIconTheme: IconThemeData(color: Colors.grey.shade600),
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
  secondaryHeaderColor: Colors.grey.shade700,
);

final darkTheme = ThemeData.dark().copyWith(
  dividerColor: Colors.white24,
  appBarTheme: AppBarTheme(
    backgroundColor: primaryColorDark,
    brightness: Brightness.dark,
    iconTheme: IconThemeData(
      color: Colors.white38,
    ),
    actionsIconTheme: IconThemeData(
      color: Colors.white38,
    ),
  ),
  primaryColor: primaryColorDark,
  accentColor: Colors.blue,
  canvasColor: secondaryColorDark,
  iconTheme: IconThemeData(color: Colors.white54),
  primaryIconTheme: IconThemeData(color: Colors.white),
  radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.resolveWith((states) =>
          states.contains(MaterialState.selected)
              ? Colors.blue
              : Colors.white54)),
  backgroundColor: primaryColorDark,
  scaffoldBackgroundColor: primaryColorDark,
  dialogBackgroundColor: secondaryColorDark,
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
  timePickerTheme: TimePickerThemeData(
    backgroundColor: secondaryColorDark,
  ),
  secondaryHeaderColor: primaryColorLight,
);

final systemUiOverlayStyleLight = SystemUiOverlayStyle(
  statusBarColor: Colors.transparent,
  statusBarIconBrightness: Brightness.dark,
  systemNavigationBarColor: primaryColorLight,
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
