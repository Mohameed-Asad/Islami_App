import 'package:flutter/material.dart';

class ThemeDataManager {
  static const Color primaryColor = Color(0xFFB7935F);
  static const Color primaryDarkColor = Color(0xFF141A2E);
  static const Color primaryDarkColor2 = Color(0xFFFACC10);

  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Colors.transparent,
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
        color: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.black,
            fontFamily: "ElMessiri")),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: primaryColor,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        selectedLabelStyle: TextStyle(
            fontFamily: "ElMessiri", fontSize: 13, color: Colors.black),
        selectedIconTheme: IconThemeData(
          color: Colors.black,
          size: 30,
        ),
        unselectedIconTheme: IconThemeData(
          color: Colors.white,
          size: 30,
        ),
        unselectedLabelStyle: TextStyle(
            fontFamily: "ElMessiri", fontSize: 13, color: Colors.white),
        unselectedItemColor: Colors.white),
  );
  static ThemeData darkTheme = ThemeData(
    primaryColor: primaryDarkColor,
    scaffoldBackgroundColor: Colors.transparent,
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      color: Colors.transparent,
      centerTitle: true,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
          color: Colors.white,
          fontFamily: "ElMessiri"),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: primaryDarkColor,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: primaryDarkColor2,
        selectedLabelStyle: TextStyle(
            fontFamily: "ElMessiri", fontSize: 13, color: Colors.black),
        selectedIconTheme: IconThemeData(
          color: primaryDarkColor2,
          size: 30,
        ),
        unselectedIconTheme: IconThemeData(
          color: Colors.white,
          size: 30,
        ),
        unselectedLabelStyle: TextStyle(
            fontFamily: "ElMessiri", fontSize: 13, color: Colors.white),
        unselectedItemColor: Colors.white),
  );

  static TextStyle primaryStyle = const TextStyle(
      fontSize: 25, fontFamily: "ElMessiri", fontWeight: FontWeight.w500);
}
