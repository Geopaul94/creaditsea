




import 'package:creditsea/presentation/screens/personal_details.dart/date_picker_controller.dart';
import 'package:creditsea/utility/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart';



class CalendarTextField extends StatelessWidget {
  final DatePickerController datePickerController = Get.find<DatePickerController>();

  CalendarTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => TextFormField(
          readOnly: true,
          onTap: () {
            datePickerController.selectDate(context);
          },
          decoration: InputDecoration(
            hintText: datePickerController.selectedDate.value.isNotEmpty
                ? datePickerController.selectedDate.value
                : 'Select Date of Birth',
            suffixIcon: const Icon(Icons.calendar_today),
            border: const OutlineInputBorder(),
          ),
        ));
  }
}