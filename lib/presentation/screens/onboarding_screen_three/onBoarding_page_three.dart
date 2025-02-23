
import 'package:creditsea/presentation/screens/onBoardingScreens.dart/headline_with_image.dart';
import 'package:creditsea/presentation/screens/onBoardingScreens.dart/icon_big_container.dart';
import 'package:creditsea/presentation/screens/onboarding_screen_three/onboardingScreenThree_container.dart';
import 'package:creditsea/presentation/screens/signup_screen/welcome_screen.dart';
import 'package:creditsea/presentation/widgets/CustomText.dart';
import 'package:creditsea/presentation/widgets/three_dots_shape.dart';

import 'package:creditsea/utility/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ONbordingScreenThree extends StatelessWidget {
  final String phoneNumber;
  const ONbordingScreenThree({super.key, required this.phoneNumber});

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
                centerImage: 'assets/images/thirdscreen_agent.png',
              ),
              CustomText(
                text: '24*7 Customer Care ',
                color: white,
                fontWeight: FontWeight.w600,
                fontSize: 18.sp,
              ),
              CustomText(
                text: 'Dedicated Customer Support team  ',
                color: white,
                fontWeight: FontWeight.w300,
                fontSize: 14.sp,
              ),
        h20,
          ThreeDotShape(index: 2),h20,
              ONbordingScreenThreeContainer(
                phoneNumber: phoneNumber,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

