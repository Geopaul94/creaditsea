

import 'package:creditsea/presentation/getx/user_controller.dart';
import 'package:creditsea/presentation/screens/personal_details.dart/personal_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class SigninController extends GetxController {
  // Unique TextEditingControllers for each field
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Reactive variable for loading state
  var isLoading = false.obs;

  // Validate phone number
  String? validatePhoneNumber(String? phoneNumber) {
    if (phoneNumber == null || phoneNumber.isEmpty || phoneNumber.length < 10) {
      return 'Please enter a valid phone number.';
    }
    return null;
  }

  // Validate password
  String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password cannot be empty.';
    }
    if (password.length < 8) {
      return 'Password must be at least 8 characters long.';
    }
    return null;
  }

  // Sign in logic
  Future<void> signIn(BuildContext context) async {
    final phoneNumber = phoneNumberController.text.trim();
    final password = passwordController.text.trim();

    // Validate phone number and password
    final phoneNumberError = validatePhoneNumber(phoneNumber);
    final passwordError = validatePassword(password);

    if (phoneNumberError != null || passwordError != null) {
      showSnackBar(true, phoneNumberError ?? passwordError!);
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
        showSnackBar(true, 'No account found with this phone number. Try creating an account.');
        return;
      }

      // Get the document data of the matching user
      final userData = querySnapshot.docs.first.data();
      final storedPassword = userData['password'] as String?;

      // Check if the password matches
      if (storedPassword == password) {
        // Password matches, navigate to the next screen
        showSnackBar(false, 'Sign in successful!');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PersonalDetails(phoneNumber:phoneNumber )),
        );
      } else {
        // Password does not match
        showSnackBar(true, 'Incorrect password. Please try again or reset your password.');
      }
    } catch (e) {
      // Show error snackbar
      showSnackBar(true, 'Failed to sign in: $e');
    } finally {
      // Stop loading
      isLoading(false);
    }
  }
}