import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PurposeofloanController extends GetxController {
  var selectedPurposeStatus = ''.obs; // Observable string for purpose status

  void setPurposeStatus(String status) {
    selectedPurposeStatus.value = status;
  }
}
class CustomPurposeFormField extends StatelessWidget {
  // Retrieve the already initialized controller using Get.find()
  final PurposeofloanController purposeofloanController =
      Get.find<PurposeofloanController>();

  CustomPurposeFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => TextFormField(
          readOnly: true,
          onTap: () {
            _showPurposeSelection(context);
          },
          decoration: InputDecoration(
            hintText: purposeofloanController.selectedPurposeStatus.value.isNotEmpty
                ? purposeofloanController.selectedPurposeStatus.value
                : 'Select Purpose of Loan',
            labelStyle: TextStyle(
              color: Colors.grey,
              fontSize: 15,
            ),
            border: const OutlineInputBorder(),
            suffixIcon: const Icon(CupertinoIcons.chevron_down),
          ),
        ));
  }

  void _showPurposeSelection(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: const Text('Select Purpose of Loan'),
          actions: <CupertinoActionSheetAction>[
            _buildAction('Education'),
            _buildAction('Marriage'),
            _buildAction('Aboard'),
            _buildAction('Personal'),
            _buildAction('Others'),
          ],
          cancelButton: CupertinoActionSheetAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context); // Close the popup
            },
            child: const Text('Cancel'),
          ),
        );
      },
    );
  }

  CupertinoActionSheetAction _buildAction(String title) {
    return CupertinoActionSheetAction(
      child: Text(title),
      onPressed: () {
        purposeofloanController.setPurposeStatus(title);
        Navigator.pop(Get.context!); // Close the popup after selection
      },
    );
  }
}







