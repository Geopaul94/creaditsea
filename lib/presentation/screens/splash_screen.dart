import 'dart:async';

import 'package:creditsea/presentation/screens/signin_screen/signin_screen.dart';
import 'package:creditsea/presentation/widgets/CustomText.dart';
import 'package:creditsea/utility/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // Delay of 2 seconds before navigating to another screen
    Timer(Duration(seconds: 2), () {
      // Navigate to the next screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SigninScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: PrimaryColor,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 150.h, // Adjust the top position as needed
              child: Image.asset(
                "assets/images/logo.png",
                height: 300.h,
                width: 250.w,
              ),
            ),
            Positioned(
              top: 380.h, // Adjust the top position as needed
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: 'Credit',
                    fontWeight: FontWeight.w500,
                    color: white,
                    fontSize: 60.sp,
                  ),
                  CustomText(
                    text: 'Sea',
                    fontWeight: FontWeight.w100,
                    color: white,
                    fontSize: 60.sp,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
