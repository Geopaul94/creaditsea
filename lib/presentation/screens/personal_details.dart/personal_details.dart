import 'package:creditsea/presentation/getx/personlaDetailController.dart';
import 'package:creditsea/presentation/screens/pan_number/register_headline.dart';
import 'package:creditsea/presentation/screens/personal_details.dart/calender_textform_field.dart';
import 'package:creditsea/presentation/screens/personal_details.dart/date_picker_controller.dart';
import 'package:creditsea/presentation/screens/personal_details.dart/gender_select_controller.dart';
import 'package:creditsea/presentation/screens/personal_details.dart/marital_status.dart';
import 'package:creditsea/presentation/widgets/CustomElevatedButton.dart';
import 'package:creditsea/presentation/widgets/CustomText.dart';
import 'package:creditsea/presentation/widgets/custometextformfield.dart';
import 'package:creditsea/utility/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

String SignInPhoneNumber = '';

class PersonalDetails extends StatefulWidget {
  final String phoneNumber;

  const PersonalDetails({super.key, required this.phoneNumber});

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  bool isLoading = true; // Controls whether to show the shimmer effect

  @override
  void initState() {
    super.initState();
    // Set SignInPhoneNumber globally
    SignInPhoneNumber = widget.phoneNumber;

    // Simulate a delay of 1.5 seconds
    Future.delayed(const Duration(milliseconds: 1500), () {
      setState(() {
        isLoading = false; // Stop showing the shimmer effect
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              if (isLoading)
                ShimmerEffect() // Show shimmer effect while loading
              else
                Column(
                  children: [
                      h60,
            RegisterHeadline(),
            h30,
                    h50,
                    PersonalDetailsContainer(),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
class PersonalDetailsContainer extends StatelessWidget {
  PersonalDetailsContainer({super.key});

  // Initialize controllers
  final GenderController genderController = Get.put(GenderController());
  final MaritalController maritalController = Get.put(MaritalController());
  final DatePickerController datePickerController =
      Get.put(DatePickerController());

  @override
  Widget build(BuildContext context) {
    final PersonalDetailsController personalDetailsController =
        Get.put(PersonalDetailsController(
      genderController: genderController,
      maritalController: maritalController,
      datePickerController: datePickerController,
    ));

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            offset: const Offset(0, 5),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      padding: const EdgeInsets.all(16.0), // Add padding around the container
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_back),
              ),
              const SizedBox(width: 20), // Use SizedBox for spacing
              const CustomText(
                text: 'Personal Details',
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ],
          ),
          h20,
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomText(
                      text: 'First Name*',
                      fontWeight: FontWeight.w600,
                    ),
                    CustomTextFormField(
                      labelText: 'Your first name',
                      controller: personalDetailsController.firstNameController,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16), // Add spacing between the form fields
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomText(
                      text: 'Last Name*',
                      fontWeight: FontWeight.w600,
                    ),
                    CustomTextFormField(
                      labelText: 'Your last name ',
                      controller: personalDetailsController.lastNameController,
                    ),
                  ],
                ),
              ),
            ],
          ),
          h20,
          CustomText(
            text: 'Gender*',
            fontWeight: FontWeight.w600,
          ),
          h10,
          CustomGenderFormField(),
          const SizedBox(height: 20),
          CustomText(
            text: 'Marital Status*',
            fontWeight: FontWeight.w600,
          ),
          h10,
          CustomMaritalFormField(),
          h20,
          CalendarTextField(),
          h100,
          Obx(() {
            return personalDetailsController.isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomElevatedButton(
                        borderRadius: 10,
                        height: 50,
                        fontSize: 20,
                        text: 'Continue',
                        onPressed: () {
                          personalDetailsController
                              .updatePersonalDetails(context);
                        },
                      ),
                    ],
                  );
          }),
          h150,
        ],
      ),
    );
  }
}



class ShimmerEffect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        children: [
          Container(
            height: 20,
            width: double.infinity,
            color: Colors.white,
          ),
          const SizedBox(height: 10),
          Container(
            height: 20,
            width: double.infinity,
            color: Colors.white,
          ),
          const SizedBox(height: 10),
          Container(
            height: 20,
            width: double.infinity,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}