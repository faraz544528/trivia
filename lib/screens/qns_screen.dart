import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travia/data/colors.dart';
import 'package:travia/widgets/custom_button.dart';

class QnsScreen extends StatefulWidget {
  const QnsScreen({super.key});

  @override
  State<QnsScreen> createState() => _QnsScreenState();
}

class _QnsScreenState extends State<QnsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Faraz Khan",
              style: TextStyle(fontSize: 25),
            ),
            Row(
              children: [
                Icon(
                  Icons.close,
                  color: Colors.red,
                )
              ],
            ),
            CustomButton(
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
