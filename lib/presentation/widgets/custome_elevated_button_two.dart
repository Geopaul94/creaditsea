import 'package:creditsea/utility/constants/constants.dart';
import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/services.dart';

class CustomElevatedButtonTwo extends StatelessWidget {
  final String text;
  final double? height;
  final double? width;
  final VoidCallback? onPressed;

  const CustomElevatedButtonTwo({
    Key? key,
    required this.text,
    this.height = 40.0, // Default height
    this.width = 200.0, // Default width
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        border: Border.all(color: PrimaryColor), // Blue border color
        borderRadius: BorderRadius.circular(8.0), // Rounded corners
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: PrimaryColor,
          backgroundColor: Colors.white, // Text color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0), // Rounded corners
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: black, // Blue text color
          ),
        ),
      ),
    );
  }
}
