import 'package:flutter/material.dart';
import 'package:travia/data/colors.dart';
import 'package:travia/screens/home_screen.dart';
import 'package:travia/screens/qns_screen.dart';
import 'package:travia/widgets/custom_button.dart';

class FinalScoreScreen extends StatefulWidget {
  const FinalScoreScreen({super.key});

  @override
  State<FinalScoreScreen> createState() => _FinalScoreScreenState();
}

class _FinalScoreScreenState extends State<FinalScoreScreen> {
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
        child: Stack(children: [
          Center(
            child: Image(
                image: AssetImage(
                    "assets/360_F_255814073_eVeqoLhJQ31uBZ3fcgaaRcYgEtYDkYkF-removebg-preview.png")),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 18, bottom: 10),
              child: SizedBox(
                height: height * 0.55,
                width: width * 0.55,
                child: Image(
                    image: AssetImage(
                        "assets/Screenshot_2025-05-03_002221-removebg-preview.png")),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Final Score",
                  style: TextStyle(),
                ),
                Text(
                  "Correct : $correct",
                  style: TextStyle(color: Colors.green.shade900),
                ),
                Text(
                  "   Incorrect : $incorrect",
                  style: TextStyle(color: Colors.red.shade900),
                ),
              ],
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 400),
                  child: CustomButton(
                    onPressed: () {},
                    gradient: true,
                    wdth: false,
                    text: "Play Again",
                  ),
                ),
                SizedBox(height: height * 0.01),
                CustomButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  gradient: true,
                  text: "Go To Home Page",
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
