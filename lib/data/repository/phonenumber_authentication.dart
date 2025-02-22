import 'package:creditsea/presentation/sample/s.dart';
import 'package:creditsea/utility/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;
  String? verificationId;

  Future<void> verifyPhoneNumber(String phoneNumber) async {
    try {
      isLoading.value = true; // Start loading

      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          // Automatically sign in if verification is completed
          await FirebaseAuth.instance.signInWithCredential(credential);
          isLoading.value = false; // Stop loading
        },
        verificationFailed: (FirebaseAuthException e) {
          Get.snackbar('Error', e.message ?? 'Verification failed');
          isLoading.value = false; // Stop loading
        },
        codeSent: (String verificationId, int? resendToken) {
          this.verificationId = verificationId;
          isLoading.value = false; // Stop loading
          Get.snackbar('Code Sent', 'Verification code sent to $phoneNumber');
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          this.verificationId = verificationId;
        },
      );
    } catch (e) {
      Get.snackbar('Error', 'Something went wrong');
      isLoading.value = false; // Stop loading
    }
  }

  Future<void> signInWithOTP(String smsCode) async {
    if (verificationId != null) {
      try {
        final credential = PhoneAuthProvider.credential(
          verificationId: verificationId!,
          smsCode: smsCode,
        );
        await FirebaseAuth.instance.signInWithCredential(credential);
      } catch (e) {
        Get.snackbar('Error', 'Invalid OTP');
      }
    }
  }
}

