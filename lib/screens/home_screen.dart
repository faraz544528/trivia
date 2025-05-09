import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travia/data/colors.dart';
import 'package:travia/data/controllers_and_vars.dart';
import 'package:travia/screens/qns_screen.dart';
import 'package:travia/widgets/custom_appbar.dart';

import 'package:travia/widgets/custom_button.dart';
import 'package:travia/widgets/user_avatar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: bgClrDark,
      appBar: CustomAppbar(text: "Welcome, ${nameController.text}"),
      body: Stack(children: [
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Image(
              fit: BoxFit.fill,
              image: AssetImage(
                "assets/Pink Clouds Wallpaper.jpeg",
              )),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: height * 0.04,
              ),
              userAvatar(
                size: false,
                photoUrl: null,
                selectedImageBytes: selectedImage,
                onPickImage: () {},
              ),
              SizedBox(
                height: height * 0.05,
              ),
              CustomButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) =>
                              QnsScreen(categoryType: "General Knowledge")));
                },
                text: "General Knowledge",
              ),
              SizedBox(
                height: height * 0.03,
              ),
              CustomButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              QnsScreen(categoryType: 'Sports')));
                },
                text: "Sports",
              ),
              SizedBox(
                height: height * 0.03,
              ),
              CustomButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              QnsScreen(categoryType: 'Technology')));
                },
                text: "Technology",
              ),
              SizedBox(
                height: height * 0.03,
              ),
              CustomButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              QnsScreen(categoryType: 'Vehicles')));
                },
                text: "Vehicles",
              ),
              SizedBox(
                height: height * 0.05,
              )
            ],
          ),
        ),
      ]),
    );
  }
}
