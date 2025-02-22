import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:creditsea/data/models/userDetail.dart';
import 'package:creditsea/presentation/getx/user_controller.dart';
import 'package:creditsea/presentation/screens/personal_details.dart/personal_details.dart';
import 'package:creditsea/presentation/widgets/validations%20.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// pancard validation
String? validatePanCard(String? panCardNumber) {
  if (panCardNumber == null || panCardNumber.isEmpty) {
    return 'PAN card number cannot be empty.';
  }

  // Regular expression for PAN card validation
  final RegExp panRegExp = RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]{1}$');

  // Check if the entered PAN card number matches the pattern
  if (!panRegExp.hasMatch(panCardNumber)) {
    return 'Please enter a valid PAN card number.';
  }

  return null; // Return null if the PAN is valid
}

class PannumberController extends GetxController {
  final TextEditingController panNumberController = TextEditingController();
  var isLoading = false.obs;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Validate and update the email in Firestore
  Future<void> requestOTP(BuildContext context) async {
    final pancard = panNumberController.text.trim();

    // Start loading
    isLoading(true);

    try {
      // Check if the phone number exists in Firestore
      final querySnapshot = await _firestore
          .collection('userDetails')
          .where('phoneNumber', isEqualTo: int.parse(SignInPhoneNumber))
          .get();

      if (querySnapshot.docs.isEmpty) {
        showSnackBar(true, 'No account found with this phone number.');
        return;
      }

      // Get the document ID of the matching user
      final userId = querySnapshot.docs.first.id;

      // Update the email in Firestore
      await _firestore.collection('userDetails').doc(userId).update({
        'pancard': pancard,
      });

      // Show success snackbar
      showSnackBar(false, 'OTP sent to $pancard.');

      // Simulate OTP being sent (mock OTP is 123456)
      print('Mock OTP sent: 123456');
    } catch (e) {
      showSnackBar(true, 'Pancard verificatin failed: $e');
    } finally {
      isLoading(false);
    }
  }
}
