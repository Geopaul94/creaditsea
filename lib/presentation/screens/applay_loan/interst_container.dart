




import 'package:creditsea/presentation/getx/purposeloan_controller/purposrofloan_controller.dart';
import 'package:creditsea/presentation/screens/onBoardingScreens.dart/headline_with_image.dart';
import 'package:creditsea/presentation/screens/offers_screen/our_offering.dart';
import 'package:creditsea/presentation/widgets/CustomElevatedButton.dart';
import 'package:creditsea/presentation/widgets/CustomText.dart';
import 'package:creditsea/presentation/widgets/custometextformfield.dart';
import 'package:creditsea/utility/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';









class InterstContainer extends StatelessWidget {
  const InterstContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.blue, // Set the border color to blue
          width: 2, // Set the border width to 2
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween, // Align children to the edges
              children: [
                CustomText(
                  text: "Principal Amount",
                  fontWeight: FontWeight.w700,
                ), // Corrected spelling from "Principle" to "Principal"
                CustomText(
                  text: "₹ 100000",
                  color: Colors.blue,
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
            h10, // Add some spacing between rows
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: "Interest",
                  fontWeight: FontWeight.w700,
                ), // Corrected spelling from "Interst" to "Interest"
                CustomText(
                  text: "1%",
                  color: Colors.blue,
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
            h10, // Add some spacing between rows
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: "Total Payable",
                  fontWeight: FontWeight.w700,
                ),
                CustomText(
                  text: "₹ 2000",
                  color: Colors.blue,
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
