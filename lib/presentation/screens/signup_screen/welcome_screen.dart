import 'package:creditsea/presentation/screens/onBoardingScreens.dart/headline_with_image.dart';
import 'package:creditsea/presentation/screens/onBoardingScreens.dart/icon_container.dart';
import 'package:creditsea/presentation/screens/signup_screen/welcomescreen_container.dart';
import 'package:creditsea/presentation/widgets/CustomText.dart';
import 'package:creditsea/presentation/widgets/three_dots_shape.dart';
import 'package:creditsea/utility/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PrimaryColor,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              h20,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Headlinewithimage(),
                ],
              ),
              h20,
              Iconcontainer(
                color: const Color.fromARGB(120, 89, 94, 146),
              ),
              h20,
              CustomText(
                text: 'Flexible loan options ',
                color: white,
                fontWeight: FontWeight.w600,
                fontSize: 18.sp,
              ),
              h5,
              CustomText(
                text: 'Loan types to cater to differnt financial needs  ',
                color: white,
                fontWeight: FontWeight.w300,
                fontSize: 14.sp,
              ),
              h10,
             ThreeDotShape(index: 0), 
      
              h10,
              WelcomeScreenContainer()
            ],
          ),
        ),
      ),
    );
  }
}



