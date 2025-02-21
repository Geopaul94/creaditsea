















import 'package:creditsea/presentation/screens/onboarding_screens/otpcontroller.dart';
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
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [CustomText(text: 'text')],
            ),
            h50,
            EmailVerificationScreenContainer()
          ],
        ),
      )),
    );
  }
}

class EmailVerificationScreenContainer extends StatefulWidget {
  const EmailVerificationScreenContainer({super.key});

  @override
  _EmailVerificationScreenContainerState createState() =>
      _EmailVerificationScreenContainerState();
}

class _EmailVerificationScreenContainerState
    extends State<EmailVerificationScreenContainer> {
  final TextEditingController _emailcontroller = TextEditingController();

  @override
  void dispose() {
    _emailcontroller.dispose();

    super.dispose();
  }

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
            offset: const Offset(0, 5),
            blurRadius: 10,
            spreadRadius: 1,
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
                  controller: _emailcontroller,
                ),
              ],
            ),
          ),
          ONbordingScreenTwoContainer(),
        ],
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
              // Show "Resend" when timer ends
              return GestureDetector(
                onTap: () {
                  if (!otpController.isCountingDown.value) {
                    otpController.resetCountdown(); // Reset countdown on tap
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
                "00:${otpController.seconds.value.toString().padLeft(2, '0')}",
                style: TextStyle(fontSize: 18),
              );
            }
          }),
          h100,
          Center(
            child: CustomElevatedButton(
              borderRadius: 10,
              height: 50.h,
              fontSize: 20.sp,
              text: 'Continue',
              onPressed: () {
                otpController.verifyOtp();
              },
            ),
          ),
          h40,
        ],
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
