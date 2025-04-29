import 'package:flutter/material.dart';
import 'package:travia/widgets/custom_button.dart';

class FinalScoreScreen extends StatefulWidget {
  const FinalScoreScreen({super.key});

  @override
  State<FinalScoreScreen> createState() => _FinalScoreScreenState();
}

class _FinalScoreScreenState extends State<FinalScoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.close),
              ],
            ),
            Text(
              "Here will be the final score",
              style: TextStyle(color: Colors.white),
            ),
            CustomButton(
              onPressed: () {},
              color: true,
              gradient: false,
              text: "True",
            ),
            CustomButton(
              onPressed: () {},
              text: "False",
              color: false,
              gradient: false,
            )
          ],
        ),
      ),
    );
  }
}
