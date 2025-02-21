import 'package:creditsea/presentation/sample/s.dart';
import 'package:creditsea/presentation/screens/personal_details.dart/calender_textform_field.dart';
import 'package:creditsea/presentation/screens/personal_details.dart/date_picker_controller.dart';
import 'package:creditsea/presentation/screens/personal_details.dart/gender_select_controller.dart';
import 'package:creditsea/presentation/screens/personal_details.dart/material_status.dart';
import 'package:creditsea/presentation/widgets/CustomElevatedButton.dart';
import 'package:creditsea/presentation/widgets/CustomText.dart';
import 'package:creditsea/presentation/widgets/custometextformfield.dart';
import 'package:creditsea/utility/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart';

class PersonalDetails extends StatelessWidget {
  const PersonalDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [CustomText(text: 'text')],
            ),

            h50,
            PersonalDetailsContainer()
          ],
        ),
      )),
    );
  }
}

class PersonalDetailsContainer extends StatefulWidget {
  const PersonalDetailsContainer({super.key});

  @override
  _PersonalDetailsContainerState createState() =>
      _PersonalDetailsContainerState();
}

class _PersonalDetailsContainerState extends State<PersonalDetailsContainer> {
  final TextEditingController _firstnamecontroller = TextEditingController();
  final TextEditingController _lastnamecontroller = TextEditingController();
  final TextEditingController _gendercontroller = TextEditingController();
  final TextEditingController _dateofbirthcontroller = TextEditingController();
  final TextEditingController _materialStatuscontroller =
      TextEditingController();

  @override
  void dispose() {
    _firstnamecontroller.dispose();
    _lastnamecontroller.dispose();
    _gendercontroller.dispose();
    _dateofbirthcontroller.dispose();
    _materialStatuscontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final DatePickerController datePickerController =
        Get.put(DatePickerController());
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
                      controller: _firstnamecontroller,
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
                      controller: _lastnamecontroller,
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
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomElevatedButton(
                borderRadius: 10,height: 50.h,fontSize: 20.sp,
                text: 'Continue',
                onPressed: () {
                  if (datePickerController.isDateSelected()) {
                    // Date is selected, proceed with your logic
                    print(
                        'Selected Date: ${datePickerController.selectedDate.value}');
                    // Add your code here to process the selected date
                  } else {
                    // Date is not selected, show an error
                    Get.snackbar(
                      'Error',
                      'Please select a date of birth.',
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
                  }
                },
              ),
            ],
          ),h150,
        ],
      ),
    );
  }
}
