import 'dart:async';

import 'package:flutter/material.dart';
import 'package:travia/data/colors.dart';
import 'package:travia/screens/onbording.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    tween();
  }

  late AnimationController animationController;
  late Animation animation;
  tween() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation = Tween(begin: 0.0, end: 300.0).animate(animationController);

    animationController.addListener(
      () {
        print(animation.value);
        setState(() {});
      },
    );
    animationController.forward();
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
      body: Stack(children: [
        SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image(
                fit: BoxFit.fill,
                image: AssetImage("assets/Pink Clouds Wallpaper.jpeg"))),
        Container(
          height: double.infinity,
          width: double.infinity,
          child: Center(
              child: SizedBox(
            height: animation.value,
            width: animation.value,
            child: Image(
                image: AssetImage(
                    "assets/Screenshot_2025-04-23_011129-removebg-preview.png")),
          )),
        ),
      ]),
    );
  }
}
