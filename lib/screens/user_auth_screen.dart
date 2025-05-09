import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travia/data/colors.dart';
import 'package:travia/data/controllers_and_vars.dart';
import 'package:travia/screens/home_screen.dart';
import 'package:travia/widgets/custom_appbar.dart';

import 'package:travia/widgets/custom_button.dart';
import 'package:travia/widgets/user_avatar.dart';

class UserAuthScreen extends StatefulWidget {
  const UserAuthScreen({super.key});

  @override
  State<UserAuthScreen> createState() => _UserAuthScreenState();
}

class _UserAuthScreenState extends State<UserAuthScreen> {
  Future uploadImage() async {
    var pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      final bytes = await pickedImage.readAsBytes();
      setState(() {
        selectedImage = bytes;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: CustomAppbar(text: "Welcome To Travia Challenge"),
      body: Stack(children: [
        SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image(
                fit: BoxFit.fill,
                image: AssetImage("assets/Pink Clouds Wallpaper.jpeg"))),
        Center(
          child: Column(
            children: [
              SizedBox(height: height * 0.1),
              userAvatar(
                photoUrl: null,
                selectedImageBytes: selectedImage,
                onPickImage: uploadImage,
              ),
              SizedBox(height: height * 0.2),
              SizedBox(
                width: width * 0.6,
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(style: BorderStyle.solid)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: bgClrDark))),
                ),
              ),
              SizedBox(height: height * 0.1),
              CustomButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                text: "SUBMIT",
                textColor: white,
              )
            ],
          ),
        ),
      ]),
    );
  }
}
