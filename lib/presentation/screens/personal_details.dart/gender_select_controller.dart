import 'package:creditsea/utility/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class GenderController extends GetxController {
  var selectedGender = ''.obs; // Observable string for selected gender

  void setGender(String gender) {
    selectedGender.value = gender;
  }
}

class CustomGenderFormField extends StatelessWidget {
  final GenderController genderController = Get.put(GenderController());

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
        labelStyle: TextStyle(color: grey, fontSize: 15.sp),
        prefixIcon: GetX<GenderController>(
          builder: (controller) {
            return Padding(
              padding: const EdgeInsets.only(
                  right: 16.0), // Adjust padding if needed
              child: Center(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: controller.selectedGender.value.isNotEmpty
                            ? controller.selectedGender.value
                            : '',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: controller.selectedGender.value.isEmpty
                            ? 'Select your Gender'
                            : '',
                        style: TextStyle(
                          color: grey,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),

        border: const OutlineInputBorder(),
        // Use suffixIcon instead of suffixText, as it accepts a widget
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
