import 'package:creditsea/data/models/userDetail.dart';
import 'package:creditsea/main.dart';
import 'package:creditsea/presentation/screens/onboarding_screen_two/onboarding_screen_two.dart';
import 'package:creditsea/presentation/screens/signup_screen/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserController extends GetxController {
  // Reactive variables
  var isLoading = false.obs; // To show/hide circular progress indicator
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Function to validate and process the phone number
  Future<void> processPhoneNumber(
      BuildContext context, String phoneNumber) async {
    // Basic validation
    if (phoneNumber.isEmpty || phoneNumber.length < 10) {
      showSnackBar(true, 'Please enter a valid phone number');
      return;
    }

    // Start loading
    isLoading(true);

    try {
      // Check if the phone number exists in Firestore
      final querySnapshot = await _firestore
          .collection('userDetails')
          .where('phoneNumber', isEqualTo: int.parse(phoneNumber))
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        // Phone number already exists
        showSnackBar(true, 'This number already exists. Try signing in.');
      } else {
        // Phone number does not exist, create a new UserDetails object
        final userId = DateTime.now()
            .millisecondsSinceEpoch
            .toString(); // Generate a unique ID
        final userDetails = UserDetails(
          userId: userId,
          phoneNumber:
              int.parse(phoneNumber), // Add only the phone number initially
        );

        // Add the UserDetails object to Firestore
        await _firestore
            .collection('userDetails')
            .doc(userId)
            .set(userDetails.toMap());

        // Show success snackbar
        showSnackBar(false, 'Success! OTP sent to this number $phoneNumber.');

        // Navigate to the next screen using Navigator.push
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ONbordingScreenTwo(phonenumber: phoneNumber),
          ),
        );
      }
    } catch (e) {
      // Show error snackbar for unexpected errors
      showSnackBar(true, 'Something went wrong: $e');
    } finally {
      // Stop loading
      isLoading(false);
    }
  }
}

// Method to show snackbar with conditional background color
void showSnackBar(bool isError, String message) {
  Get.snackbar(
    isError ? 'Error' : 'Success', // Title changes based on error/success
    message, // The message passed to the function
    backgroundColor:
        isError ? Colors.red : Colors.blue, // Red for errors, blue for success
    colorText: Colors.white,
    snackPosition: SnackPosition.BOTTOM, // Display at the bottom
    margin: const EdgeInsets.all(10),
    borderRadius: 8,
    duration: const Duration(seconds: 2),
  );
}
