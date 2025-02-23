
import 'package:creditsea/presentation/getx/otp_timer/otpcontroller.dart';
import 'package:creditsea/presentation/screens/onboarding_screen_two/otp_input_container.dart';

import 'package:creditsea/presentation/screens/signup_screen/welcome_screen.dart';
import 'package:creditsea/presentation/widgets/CustomElevatedButton.dart';
import 'package:creditsea/presentation/widgets/CustomText.dart';

import 'package:creditsea/utility/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';















class ONbordingScreenTwoContainer extends StatelessWidget {
  final String phonenumber;
  ONbordingScreenTwoContainer({super.key, required this.phonenumber});

  final OtpController otpController = Get.put(OtpController());

  @override
  Widget build(BuildContext context) {
    otpController.startCountdown();

    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Container(
        height: 600.h,
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
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WelcomeScreen()),
                        );
                      },
                    ),
                    w60,
                    CustomText(
                      text: "Enter OTP",
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                h10,
                CustomText(
                  text: "Verify OTP, Sent on  +91 $phonenumber",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
                h10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OtpInput(otpController.fieldOne, true),
                    OtpInput(otpController.fieldTwo, false),
                    OtpInput(otpController.fieldThree, false),
                    OtpInput(otpController.fieldFour, false),
                    OtpInput(otpController.fieldFive, false),
                    OtpInput(otpController.fieldSix, false),
                  ],
                ),
                h10,
                Obx(() {
                  if (otpController.seconds.value == -1) {
                    // Show "Resend" when timer ends
                    return GestureDetector(
                      onTap: () {
                        if (!otpController.isCountingDown.value) {
                          otpController
                              .resetCountdown(); // Reset countdown on tap
                        }
                      },
                      child: Text(
                        "Resend",
                        style: TextStyle(fontSize: 18, color: Colors.blue),
                      ),
                    );
                  } else {
                    // Show the countdown timer
                    return Text(
                      "00:${otpController.seconds.value.toString().padLeft(2, '0')}",
                      style: TextStyle(fontSize: 18),
                    );
                  }
                }),
                h20,
                Center(
                  child: CustomElevatedButton(
                    width: double.infinity,
                    text: 'Verify',
                    onPressed: () {
                      otpController.verifyOtp(context,phonenumber);


                      
                    },
                  ),
                ),
                h40,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

