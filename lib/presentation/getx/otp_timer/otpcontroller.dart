import 'package:creditsea/presentation/getx/user_controller.dart';
import 'package:creditsea/presentation/screens/onboarding_screen_two/onBoarding_page_three.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  // Unique TextEditingControllers for each OTP field
  final TextEditingController fieldOne = TextEditingController();
  final TextEditingController fieldTwo = TextEditingController();
  final TextEditingController fieldThree = TextEditingController();
  final TextEditingController fieldFour = TextEditingController();
  final TextEditingController fieldFive = TextEditingController();
  final TextEditingController fieldSix = TextEditingController();

  // Reactive variables
  RxString otp = ''.obs; // To store the concatenated OTP
  RxInt seconds = 60.obs; // Countdown duration (60 seconds)
  RxBool isCountingDown = true.obs; // Track if the countdown is active

  @override
  void onInit() {
    super.onInit();
    startCountdown(); // Start the countdown timer when the controller initializes
  }

  // Start the countdown timer
  void startCountdown() {
    if (!isCountingDown.value) {
      isCountingDown.value = true; // Set the countdown state to active
    }
    Future.delayed(const Duration(seconds: 1), () {
      if (seconds.value > 0) {
        seconds.value--;
        startCountdown(); // Continue the countdown
      } else {
        seconds.value = -1; // Allow "Resend" to be displayed
        isCountingDown.value = false; // Countdown ends
      }
    });
  }

  // Reset the countdown and start again
  void resetCountdown() {
    seconds.value = 60; // Reset to 60 seconds
    startCountdown(); // Start the countdown again
  }

  // Concatenate OTP fields and validate
  void verifyOtp(BuildContext context, String phoneNumber) {
    // Check if any field is empty
    if (fieldOne.text.isEmpty ||
        fieldTwo.text.isEmpty ||
        fieldThree.text.isEmpty ||
        fieldFour.text.isEmpty ||
        fieldFive.text.isEmpty ||
        fieldSix.text.isEmpty) {
      showSnackBar(true, 'Please enter OTP 123456.');
      return;
    }

    // Concatenate OTP fields
    otp.value =
        '${fieldOne.text}${fieldTwo.text}${fieldThree.text}${fieldFour.text}${fieldFive.text}${fieldSix.text}';

    // Validate OTP
    if (otp.value == '123456') {
      // OTP is correct
      showSnackBar(false, 'OTP verification successful!');
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ONbordingScreenThree(
                  phoneNumber: phoneNumber,
                )),
      );
    } else {
      // OTP is incorrect
      showSnackBar(true, 'Invalid OTP. Please enter 123456.');
    }
  }
}
