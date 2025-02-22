import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:creditsea/data/models/userDetail.dart';
import 'package:creditsea/presentation/getx/user_controller.dart';
import 'package:creditsea/presentation/screens/personal_details.dart/personal_details.dart';
import 'package:creditsea/presentation/widgets/validations%20.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  var isLoading = false.obs;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Validate and update the email in Firestore
  Future<void> requestOTP(BuildContext context) async {
    final email = emailController.text.trim();

    // Validate email
    final emailError = validateEmail(email);
    if (emailError != null) {
      showSnackBar(true, emailError);
      return;
    }

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
        'email': email,
      });

      // Show success snackbar
      showSnackBar(false, 'OTP sent to $email.');

      // Simulate OTP being sent (mock OTP is 123456)
      print('Mock OTP sent: 123456');
    } catch (e) {
      showSnackBar(true, 'Failed to send OTP: $e');
    } finally {
      isLoading(false);
    }
  }

  
}
