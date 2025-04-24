import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travia/data/colors.dart';

Widget userAvatar({
  required String? photoUrl,
  required Uint8List? selectedImageBytes, // 🔥 add this
  required VoidCallback onPickImage,
  bool? size = true,
}) {
  return Stack(
    children: [
      Container(
        height: size! ? 160 : 80,
        width: size ? 160 : 80,
        decoration: BoxDecoration(
          color: bgClr,
          shape: BoxShape.circle,
        ),
        child: photoUrl != null &&
                photoUrl.isNotEmpty // ✅ Fixed empty string issue
            ? CircleAvatar(
                backgroundColor: bgClrDark,
                radius: 80,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(80),
                  child: Image.network(
                    photoUrl,
                    width: 160,
                    height: 160,
                    fit: BoxFit.cover,
                  ),
                ),
              )
            : selectedImageBytes !=
                    null // ✅ Cross-platform file image rendering
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(80),
                    child: Image.memory(
                      selectedImageBytes,
                      width: 160,
                      height: 160,
                      fit: BoxFit.cover,
                    ),
                  )
                : Icon(
                    FontAwesomeIcons.userLarge,
                    size: 65,
                    color: bgClr,
                  ),
      ),
      if (size)
        Positioned(
          bottom: 0,
          right: 0,
          child: InkWell(
            onTap: onPickImage,
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: bgClr,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: 3,
                ),
              ),
              child: Icon(
                FontAwesomeIcons.pen,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ),
    ],
  );
}
