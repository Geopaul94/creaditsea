import 'package:creditsea/presentation/getx/email_controller/email_controller.dart';
import 'package:creditsea/presentation/getx/email_controller/emailotp_controller.dart';
import 'package:creditsea/presentation/screens/onboarding_screen_two/otp_input_container.dart';
import 'package:creditsea/presentation/screens/pan_number/register_headline.dart';
import 'package:creditsea/presentation/widgets/CustomElevatedButton.dart';
import 'package:creditsea/presentation/widgets/CustomText.dart';
import 'package:creditsea/presentation/widgets/custometextformfield.dart';
import 'package:creditsea/utility/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EmailOTPVerificationContainer extends StatelessWidget {
  EmailOTPVerificationContainer({super.key});

  final EmailController emailController = Get.put(EmailController());
  final EmailotpController emailotpController = Get.put(EmailotpController());
  @override
  Widget build(BuildContext context) {
    emailotpController.startCountdown();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          h20,
          h10,
          CustomText(
            text: "OTP verifcation",
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          ),
          h10,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OtpInput(emailotpController.fieldOne, true),
              OtpInput(emailotpController.fieldTwo, false),
              OtpInput(emailotpController.fieldThree, false),
              OtpInput(emailotpController.fieldFour, false),
              OtpInput(emailotpController.fieldFive, false),
              OtpInput(emailotpController.fieldSix, false),
            ],
          ),
          h10,
          Obx(() {
            if (emailotpController.seconds.value == -1) {
              // Show "Resend" when timer ends
              return GestureDetector(
                onTap: () {
                  if (!emailotpController.isCountingDown.value) {
                    emailotpController
                        .resetCountdown(); // Reset countdown on tap
                  }
                },
                child: Row(
                  children: [
                    CustomText(
                      text: "Don't recieve it? ",
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    Text(
                      "Resend code ",
                      style: TextStyle(fontSize: 18, color: Colors.blue),
                    ),
                  ],
                ),
              );
            } else {
              // Show the countdown timer
              return Text(
                "00:${emailotpController.seconds.value.toString().padLeft(2, '0')}",
                style: TextStyle(fontSize: 18),
              );
            }
          }),
          h50,
          h20,
          Center(
            child: CustomElevatedButton(
              borderRadius: 10,
              height: 50.h,
              fontSize: 20.sp,
              text: 'Verify',
              onPressed: () {
                emailotpController.verifyOtp(context);
              },
            ),
          ),
          h40,
        ],
      ),
    );
  }
}
