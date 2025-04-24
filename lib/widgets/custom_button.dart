import 'package:flutter/material.dart';
import 'package:travia/data/colors.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key,
      required this.onPressed,
      this.text = '',
      this.textColor,
      this.wdth = true,
      this.color = true,
      this.gradient = true});
  VoidCallback? onPressed;
  String? text;
  Color? textColor;
  bool? color;
  bool? gradient;

  bool wdth;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Card(
      elevation: 4,
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          height: height * 0.08,
          width: wdth ? width * 0.6 : width * 0.3,
          decoration: BoxDecoration(
              color: color! ? Colors.green.shade700 : Colors.red.shade900,
              gradient: gradient!
                  ? LinearGradient(
                      colors: [bgClr, bgClrDark],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)
                  : null,
              borderRadius: BorderRadius.circular(12)),
          child: Center(
            child: Text(
              text!,
              style: TextStyle(color: textColor ?? white, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
