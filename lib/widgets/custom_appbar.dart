import 'package:flutter/material.dart';
import 'package:travia/data/colors.dart';
import 'package:travia/data/controllers_and_vars.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppbar({super.key, this.text});
  String? text;
  @override
  Size get preferredSize => Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return AppBar(
      flexibleSpace: Container(
        height: height * 0.1,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [bgClr, bgClrDark],
                begin: Alignment.centerRight,
                end: Alignment.centerLeft)),
        child: Center(
          child: Text(
            text!,
            style: TextStyle(
                color: white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
