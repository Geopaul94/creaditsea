import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import 'package:get/get.dart';

class OtpController extends GetxController {
  final TextEditingController fieldOne = TextEditingController();
  final TextEditingController fieldTwo = TextEditingController();
  final TextEditingController fieldThree = TextEditingController();
  final TextEditingController fieldFour = TextEditingController();

  RxString otp = ''.obs;
  RxInt seconds = 60.obs; // Countdown duration (60 seconds)
  bool isCountingDown = false; // Track if the countdown is active

  @override
  void onInit() {
    super.onInit();
    startCountdown();
  }

  void startCountdown() {
    if (!isCountingDown) {
      isCountingDown = true; // Set the countdown state to active
      Future.delayed(Duration(seconds: 1), () {
        if (seconds.value > 0) {
          seconds.value--;
          startCountdown(); // Continue the countdown
        } else {
          seconds.value = -1; // Allow resend OTP
          isCountingDown = false; // Reset the countdown state
        }
      });
    }
  }

  void resetCountdown() {
    seconds.value = 60; // Reset to 60 seconds
    startCountdown(); // Start the countdown again
  }

  void verifyOtp() {
    otp.value =
        fieldOne.text + fieldTwo.text + fieldThree.text + fieldFour.text;
    // Add verification logic here
  }
}
