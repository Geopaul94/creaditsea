import 'package:creditsea/presentation/getx/email_controller.dart';
import 'package:creditsea/presentation/getx/emailotp_controller.dart';
import 'package:creditsea/presentation/getx/otp_timer/otpcontroller.dart';
import 'package:creditsea/presentation/screens/onboarding_screen_two/onboarding_screen_two.dart';
import 'package:creditsea/presentation/screens/pan_number/register_headline.dart';
import 'package:creditsea/presentation/screens/personal_details.dart/personal_details.dart';
import 'package:creditsea/presentation/widgets/CustomElevatedButton.dart';
import 'package:creditsea/presentation/widgets/CustomText.dart';
import 'package:creditsea/presentation/widgets/custometextformfield.dart';
import 'package:creditsea/utility/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EmailVerificationScreen extends StatelessWidget {
  const EmailVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            h60,
            RegisterHeadline(),
            h30,
            EmailVerificationScreenContainer()
          ],
        ),
      )),
    );
  }
}

class EmailVerificationScreenContainer extends StatelessWidget {
  EmailVerificationScreenContainer({super.key});

  final EmailController emailController = Get.put(EmailController());
  final EmailotpController emailotpController = Get.put(EmailotpController());
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            offset: const Offset(0, 1),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      padding: const EdgeInsets.all(16.0), // Add padding around the container
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_back),
                ),
                w10,
                const CustomText(
                  text: 'Personal Email ID',
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
          ),
          h15,
          Image.asset('assets/images/email.png'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'Email ID*',
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                h10,
                CustomTextFormField(
                  labelText: 'Enter your email ID',
                  controller: emailController.emailController,
                ),
                h20,
                Obx(() {
                  return emailController.isLoading.value
                      ? const Center(child: CircularProgressIndicator())
                      : CustomElevatedButton(
                          paddingHorizontal: 4,
                          paddingVertical: 2,
                          borderRadius: 10,
                          height: 35.h,
                          fontSize: 14.sp,
                          text: 'Request OTP',
                          onPressed: () {
                            emailController.requestOTP(context);
                          },
                        );
                }),
              ],
            ),
          ),
          EmailOTPVerificationContainer(),
        ],
      ),
    );
  }
}

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
