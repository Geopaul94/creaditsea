import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class GenderController extends GetxController {
  var selectedGender = ''.obs; // Observable string for selected gender

  void setGender(String gender) {
    selectedGender.value = gender;
  }
}

class CustomGenderFormField extends StatelessWidget {
  final GenderController genderController = Get.find<GenderController>();

  CustomGenderFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      onTap: () {
        _showGenderSelection(context);
      },
      decoration: InputDecoration(
        labelText: 'Select your Gender',
        labelStyle: TextStyle(color: Colors.grey, fontSize: 15),
        prefixIcon: GetX<GenderController>(
          builder: (controller) {
            return Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Center(
                child: Text(
                  controller.selectedGender.value.isNotEmpty
                      ? controller.selectedGender.value
                      : 'Select your Gender',
                  style: TextStyle(
                    color: controller.selectedGender.value.isNotEmpty
                        ? Colors.black
                        : Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            );
          },
        ),
        border: const OutlineInputBorder(),
        suffixIcon: const Icon(CupertinoIcons.chevron_down),
      ),
    );
  }

  void _showGenderSelection(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext builder) {
        return CupertinoActionSheet(
          title: const Text('Select Gender'),
          actions: <CupertinoActionSheetAction>[
            CupertinoActionSheetAction(
              child: const Text('Male'),
              onPressed: () {
                genderController.setGender('Male');
                Navigator.pop(context);
              },
            ),
            CupertinoActionSheetAction(
              child: const Text('Female'),
              onPressed: () {
                genderController.setGender('Female');
                Navigator.pop(context);
              },
            ),
            CupertinoActionSheetAction(
              child: const Text('Not to disclose'),
              onPressed: () {
                genderController.setGender('Not to disclose');
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
