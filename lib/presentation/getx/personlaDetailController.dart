import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:creditsea/presentation/getx/user_controller.dart';
import 'package:creditsea/presentation/screens/applay_loan/applay_loan.dart';
import 'package:creditsea/presentation/screens/personal_details.dart/date_picker_controller.dart';
import 'package:creditsea/presentation/screens/personal_details.dart/email_verification_screen.dart';
import 'package:creditsea/presentation/screens/personal_details.dart/gender_select_controller.dart';
import 'package:creditsea/presentation/screens/personal_details.dart/marital_status.dart';
import 'package:creditsea/presentation/screens/personal_details.dart/personal_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonalDetailsController extends GetxController {
  // Controllers for personal details
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  // Pass controllers as parameters
  final GenderController genderController;
  final MaritalController maritalController;
  final DatePickerController datePickerController;

  // Constructor to accept controllers
  PersonalDetailsController({
    required this.genderController,
    required this.maritalController,
    required this.datePickerController,
  });

  // Reactive variable for loading state
  var isLoading = false.obs;

  // Validate all fields
  String? validateFields() {
    if (firstNameController.text.trim().isEmpty) {
      return 'First name cannot be empty.';
    }
    if (lastNameController.text.trim().isEmpty) {
      return 'Last name cannot be empty.';
    }
    if (genderController.selectedGender.value.isEmpty) {
      return 'Please select your gender.';
    }
    if (maritalController.selectedMaritalStatus.value.isEmpty) {
      return 'Please select your marital status.';
    }
    if (!datePickerController.isDateSelected()) {
      return 'Please select your date of birth.';
    }
    return null;
  }

  // Update personal details in Firestore
  Future<void> updatePersonalDetails(BuildContext context) async {
    final validationError = validateFields();
    if (validationError != null) {
      showSnackBar(true, validationError);
      return;
    }

    // Start loading
    isLoading(true);

    try {
      // Convert the global phone number to an integer
      final int phoneNumberAsInt =
          int.tryParse(SignInPhoneNumber) ?? -1; // Use -1 for invalid format

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
        showSnackBar(true, 'No account found with this phone number.');
        return;
      }

      // Get the document ID of the matching user
      final userId = querySnapshot.docs.first.id;

      // Update the personal details in the document
      await FirebaseFirestore.instance
          .collection('userDetails')
          .doc(userId)
          .update({
        'firstName': firstNameController.text.trim(),
        'lastName': lastNameController.text.trim(),
        'gender': genderController.selectedGender.value,
        'maritalStatus': maritalController.selectedMaritalStatus.value,
        'dateOfBirth': datePickerController.selectedDate.value,
      });

      // Show success snackbar
      showSnackBar(false, 'Personal details updated successfully!');
      // Navigate to the next screen or perform other actions
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const EmailVerificationScreen()),
      );
    } catch (e) {
      // Show error snackbar
      showSnackBar(true, 'Failed to update personal details: $e');
    } finally {
      // Stop loading
      isLoading(false);
    }
  }
}
