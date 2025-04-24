import 'dart:async';

import 'package:flutter/material.dart';
import 'package:travia/data/colors.dart';
import 'package:travia/screens/onbording.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Onbording()));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [bgClr, bgClrDark],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Center(
            child: Image(
                image: AssetImage(
                    "assets/Screenshot_2025-04-23_011129-removebg-preview.png"))),
      ),
    );
  }
}
