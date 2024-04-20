import 'dart:async';

import 'package:flutter/material.dart';
import 'package:islamii_app/features/home_screen.dart';
import 'package:provider/provider.dart';

import '../../app_manager/settings_provider.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "SplashScreen";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var pointer = Provider.of<SettingsProvider>(context);
    return Scaffold(
        body: Image.asset(
            pointer.isDark()
                ? "assets/Images/splash_dark.png"
                : "assets/Images/Group_8.png",
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover));
  }
}
