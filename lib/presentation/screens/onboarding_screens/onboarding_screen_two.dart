import 'package:creditsea/presentation/screens/onBoardingScreens.dart/headline_with_image.dart';
import 'package:creditsea/presentation/screens/onBoardingScreens.dart/icon_big_container.dart';
import 'package:creditsea/presentation/screens/onBoardingScreens.dart/icon_container.dart';
import 'package:creditsea/presentation/screens/onBoardingScreens.dart/tick_container.dart';
import 'package:creditsea/presentation/screens/onboarding_screens/otpcontroller.dart';
import 'package:creditsea/presentation/widgets/CustomElevatedButton.dart';
import 'package:creditsea/presentation/widgets/CustomText.dart';

import 'package:creditsea/utility/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ONbordingScreenTwo extends StatelessWidget {
  ONbordingScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PrimaryColor,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              h20,
              Headlinewithimage(),
              IconBigContainer(
                centerImage: 'assets/images/secondscreenOnbordingImageIcon.png',
                sideImage: 'assets/images/secondscreenOnbordingImageIcon.png',
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
              ),
              h40,
              ONbordingScreenTwoContainer(),
            ],
          ),
        ),
      ),
    );
  }
}

class OtpInput extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;
  const OtpInput(this.controller, this.autoFocus, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 50,
      child: TextField(
        autofocus: autoFocus,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: controller,
        maxLength: 1,
        cursorColor: Theme.of(context).primaryColor,
        decoration: const InputDecoration(
            border: OutlineInputBorder(),
            counterText: '',
            hintStyle: TextStyle(color: Colors.black, fontSize: 20.0)),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }
}

class ONbordingScreenTwoContainer extends StatelessWidget {
  ONbordingScreenTwoContainer({super.key});

  final OtpController otpController = Get.put(OtpController());

  @override
  Widget build(BuildContext context) {
    otpController.startCountdown();

    final size = MediaQuery.of(context).size;
    double availableHeight = size.height - 430;

    return SingleChildScrollView(
      child: Container(
        height: availableHeight,
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          gradient: const LinearGradient(
            colors: [
              Color(0xFF0075FF),
              Color(0xFF00A676),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Container(
          margin: const EdgeInsets.only(top: 7.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                h20,
                Center(
                  child: CustomText(
                    text: "Enter OTP ",
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                h10,
                CustomText(
                  text: "Verify OTP, Sent on  +91 8800642354",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
                h10,
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OtpInput(otpController.fieldOne, true),
                      w20,
                      OtpInput(otpController.fieldTwo, false),
                      w20,
                      OtpInput(otpController.fieldThree, false),
                      w20,
                      OtpInput(otpController.fieldFour, false),
                    ],
                  ),
                ),
                h10,
                Obx(() {
                  if (otpController.seconds.value == -1) {
                    return GestureDetector(
                      onTap: () {
                        otpController
                            .resetCountdown(); // Reset countdown on tap
                      },
                      child: Text("Resend",
                          style: TextStyle(fontSize: 24, color: Colors.blue)),
                    );
                  } else {
                    return Text(
                      "00:${otpController.seconds.value.toString().padLeft(2, '0')}",
                      style: TextStyle(fontSize: 24),
                    );
                  }
                }),
                Center(
                  child: CustomElevatedButton(
                    width: double.infinity,
                    text: 'Verify',
                    onPressed: () {
                      otpController.verifyOtp();
                    },
                  ),
                ),
                h10,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
