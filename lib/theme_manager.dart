import 'package:flutter/material.dart';

class ThemeDataManager {
  static const Color primaryColor = Color(0xFFB7935F);
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
  static TextStyle primaryStyle = const TextStyle(
      fontSize: 25, fontFamily: "ElMessiri", fontWeight: FontWeight.w500);
}
