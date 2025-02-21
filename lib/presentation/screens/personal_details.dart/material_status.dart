import 'package:creditsea/presentation/screens/personal_details.dart/material_status.dart';
import 'package:creditsea/utility/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Assuming you're using ScreenUtil for responsive design

class MarrialController extends GetxController {
  var selectedGender = ''.obs; // Observable string for selected gender

  void setGender(String gender) {
    selectedGender.value = gender;
  }
}

class CustomMaritalFormField extends StatelessWidget {
  final MarrialController materialController = Get.put(MarrialController());

  CustomMaritalFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => TextFormField(
          readOnly: true,
          onTap: () {
            _showMatrialSelection(context);
          },
          decoration: InputDecoration(
            labelText: materialController.selectedGender.value.isEmpty
                ? 'Select '
                : materialController.selectedGender.value,
            labelStyle: TextStyle(
              color: Colors.grey,
              fontSize: 15.sp,
            ),
            border: const OutlineInputBorder(),
            suffixIcon: const Icon(CupertinoIcons.chevron_down),
          ),
        ));
  }

  void _showMatrialSelection(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext builder) {
        return CupertinoActionSheet(
          title: const Text('Select'),
          actions: <CupertinoActionSheetAction>[
            CupertinoActionSheetAction(
              child: const Text('Married'),
              onPressed: () {
                materialController.setGender('Married');
                Navigator.pop(context);
              },
            ),
            CupertinoActionSheetAction(
              child: const Text('Unmarried'),
              onPressed: () {
                materialController.setGender('Unmarried');
                Navigator.pop(context);
              },
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
        );
      },
    );
  }
}
