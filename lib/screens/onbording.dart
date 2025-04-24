import 'package:flutter/material.dart';
import 'package:travia/data/colors.dart';
import 'package:travia/screens/user_auth_screen.dart';
import 'package:travia/widgets/custom_button.dart';

class Onbording extends StatefulWidget {
  const Onbording({super.key});

  @override
  State<Onbording> createState() => _OnbordingState();
}

class _OnbordingState extends State<Onbording> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                  image: AssetImage(
                      "assets/Screenshot_2025-04-23_000852-removebg-preview.png")),
              SizedBox(height: height * 0.1),
              Text(
                "Find Quizez to Test Out Your\n                Knowledge",
                style: TextStyle(color: white, fontSize: 20),
              ),
              SizedBox(height: height * 0.1),
              CustomButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UserAuthScreen()));
                },
                text: "Let's Start",
              )
            ],
          ),
        ),
      ),
    );
  }
}
