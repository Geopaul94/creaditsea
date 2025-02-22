import 'package:creditsea/presentation/screens/personal_details.dart/marital_status.dart';
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

class MaritalController extends GetxController {
  var selectedMaritalStatus = ''.obs; // Observable string for marital status

  void setMaritalStatus(String status) {
    selectedMaritalStatus.value = status;
  }
}







class CustomMaritalFormField extends StatelessWidget {
  final MaritalController maritalController = Get.find<MaritalController>();

  CustomMaritalFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => TextFormField(
          readOnly: true,
          onTap: () {
            _showMaritalSelection(context);
          },
          decoration: InputDecoration(
            labelText: maritalController.selectedMaritalStatus.value.isNotEmpty
                ? maritalController.selectedMaritalStatus.value
                : 'Select Marital Status',
            labelStyle: TextStyle(
              color: Colors.grey,
              fontSize: 15,
            ),
            border: const OutlineInputBorder(),
            suffixIcon: const Icon(CupertinoIcons.chevron_down),
          ),
        ));
  }

  void _showMaritalSelection(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext builder) {
        return CupertinoActionSheet(
          title: const Text('Select Marital Status'),
          actions: <CupertinoActionSheetAction>[
            CupertinoActionSheetAction(
              child: const Text('Married'),
              onPressed: () {
                maritalController.setMaritalStatus('Married');
                Navigator.pop(context);
              },
            ),
            CupertinoActionSheetAction(
              child: const Text('Unmarried'),
              onPressed: () {
                maritalController.setMaritalStatus('Unmarried');
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