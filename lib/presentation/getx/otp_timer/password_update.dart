import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:creditsea/presentation/getx/signup_controller/user_controller.dart';
import 'package:creditsea/presentation/screens/onboarding_screen_three/onBoarding_page_three.dart';
import 'package:creditsea/presentation/screens/signin_screen/signin_screen.dart';
import 'package:creditsea/presentation/widgets/validations%20.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordController extends GetxController {
  // Unique TextEditingControllers for each field
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController =
      TextEditingController();

  // Reactive variable for loading state
  var isLoading = false.obs;

  // Update password in Firebase
  Future<void> updatePassword(BuildContext context, String phoneNumber) async {
    final password = passwordController.text.trim();
    final confirmPassword = confirmpasswordController.text.trim();

    // Validate password and confirm password
    final passwordError = validatePassword(password);
    final confirmPasswordError =
        validateConfirmPassword(password, confirmPassword);

    if (passwordError != null || confirmPasswordError != null) {
      showSnackBar(true, passwordError ?? confirmPasswordError!);
      return;
    }

    // Start loading
    isLoading(true);

    try {
      // Convert the phone number from String to Integer
      final int phoneNumberAsInt = int.tryParse(phoneNumber) ??
          -1; // Use -1 or another invalid value if parsing fails

      if (phoneNumberAsInt == -1) {
        showSnackBar(true, 'Invalid phone number format.');
        return;
      }

      // Query Firestore to find the document containing the phone number
      final querySnapshot = await FirebaseFirestore.instance
          .collection('userDetails')
          .where('phoneNumber', isEqualTo: phoneNumberAsInt)
          .get();

      if (querySnapshot.docs.isEmpty) {
        // No document found with the given phone number
        showSnackBar(true, 'No user found with this phone number.');
        return;
      }

      // Get the document ID of the matching user
      final userId = querySnapshot.docs.first.id;

      // Update the password field in the document
      await FirebaseFirestore.instance
          .collection('userDetails')
          .doc(userId)
          .update({'password': password});

      // Show success snackbar
      showSnackBar(false, 'Account created successfully!');

      // Navigate to the next screen or perform other actions
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SigninScreen()),
      );
    } catch (e) {
      // Show error snackbar
      showSnackBar(true, 'Failed to update password: $e');
    } finally {
      // Stop loading
      isLoading(false);
    }
  }
}
