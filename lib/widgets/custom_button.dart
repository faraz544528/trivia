import 'package:flutter/material.dart';
import 'package:travia/data/colors.dart';

class CustomButton extends StatefulWidget {
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
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton>
    with SingleTickerProviderStateMixin {
  late Animation animationController;

  animation() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Card(
      elevation: 4,
      child: Container(
        height: height * 0.08,
        width: widget.wdth ? width * 0.6 : width * 0.3,
        decoration: BoxDecoration(
            color: widget.color! ? Colors.green.shade700 : Colors.red.shade900,
            gradient: widget.gradient!
                ? LinearGradient(
                    colors: [bgClr, bgClrDark],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)
                : null,
            borderRadius: BorderRadius.circular(12)),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Color.fromRGBO(10, 20, 30, 1 - 0.7),
            borderRadius: BorderRadius.circular(12),
            onTap: widget.onPressed,
            child: Container(
              child: Center(
                child: Text(
                  widget.text!,
                  style:
                      TextStyle(color: widget.textColor ?? white, fontSize: 20),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
