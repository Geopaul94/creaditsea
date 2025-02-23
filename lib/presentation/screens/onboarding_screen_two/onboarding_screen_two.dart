import 'package:creditsea/presentation/screens/onBoardingScreens.dart/headline_with_image.dart';
import 'package:creditsea/presentation/screens/onBoardingScreens.dart/icon_big_container.dart';
import 'package:creditsea/presentation/screens/onboarding_screen_two/onboarding_screen_two_container.dart';

import 'package:creditsea/presentation/screens/signup_screen/welcome_screen.dart';
import 'package:creditsea/presentation/widgets/CustomText.dart';
import 'package:creditsea/presentation/widgets/three_dots_shape.dart';

import 'package:creditsea/utility/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ONbordingScreenTwo extends StatelessWidget {
  final String phonenumber;
  const ONbordingScreenTwo({super.key, required this.phonenumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PrimaryColor,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              h30,
              Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Headlinewithimage(),
                ],
              )),
              h30,
              IconBigContainer(
                centerImage: 'assets/images/secondscreenOnbordingImageIcon.png',
              ),
              CustomText(
                text: 'Instant Loan Approval ',
                color: white,
                fontWeight: FontWeight.w600,
                fontSize: 18.sp,
              ),
              CustomText(
                text: 'Users will receive approval within minutes  ',
                color: white,
                fontWeight: FontWeight.w300,
                fontSize: 14.sp,
              ),  h20, 
          ThreeDotShape(index: 1), // Square at index 1
        
              h20,
              ONbordingScreenTwoContainer(
                phonenumber: phonenumber,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

