import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  final TextEditingController fieldOne = TextEditingController();
  final TextEditingController fieldTwo = TextEditingController();
  final TextEditingController fieldThree = TextEditingController();
  final TextEditingController fieldFour = TextEditingController();

  RxString otp = ''.obs;
  RxInt seconds = 60.obs; // Countdown duration (60 seconds)
  RxBool isCountingDown = true.obs; // Track if the countdown is active

  @override
  void onInit() {
    super.onInit();
    startCountdown();
  }

  // Start the countdown timer
  void startCountdown() {
    if (!isCountingDown.value) {
      isCountingDown.value = true; // Set the countdown state to active
    }
    Future.delayed(Duration(seconds: 1), () {
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

  void verifyOtp() {
    otp.value = fieldOne.text + fieldTwo.text + fieldThree.text + fieldFour.text;
    // Add OTP verification logic here
  }
}
