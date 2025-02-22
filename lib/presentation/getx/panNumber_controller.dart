import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:creditsea/data/models/userDetail.dart';
import 'package:creditsea/presentation/getx/user_controller.dart';
import 'package:creditsea/presentation/screens/applay_loan/applay_loan.dart';
import 'package:creditsea/presentation/screens/personal_details.dart/personal_details.dart';
import 'package:creditsea/presentation/widgets/validations%20.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PannumberController extends GetxController {
  final TextEditingController panNumberController = TextEditingController();
  var isLoading = false.obs;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Validate PAN card and update Firestore
  Future<void> validateAndSavePanCard(BuildContext context) async {
    final pancard = panNumberController.text.toUpperCase().trim();

    // Validate PAN card number
    final panError = validatePanCard(pancard);
    if (panError != null) {
      showSnackBar(true, panError);
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

      // Update the PAN card number in Firestore
      await _firestore.collection('userDetails').doc(userId).update({
        'panCard': pancard,
      });

      // Show success snackbar
      showSnackBar(false, 'PAN card saved successfully!');

      // Navigate to the next screen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ApplayLoanScreen()),
      );
    } catch (e) {
      showSnackBar(true, 'Failed to save PAN card: $e');
    } finally {
      isLoading(false);
    }
  }
}
