



import 'package:creditsea/presentation/getx/purposeloan_controller/purposrofloan_controller.dart';
import 'package:creditsea/presentation/screens/applay_loan/dashboard_container.dart';
import 'package:creditsea/presentation/screens/applay_loan/interst_container.dart';
import 'package:creditsea/presentation/screens/applay_loan/loan_amount_slider.dart';
import 'package:creditsea/presentation/screens/applay_loan/tenure_slider.dart';
import 'package:creditsea/presentation/screens/application_status/application_status.dart';
import 'package:creditsea/presentation/screens/onBoardingScreens.dart/headline_with_image.dart';
import 'package:creditsea/presentation/screens/offers_screen/our_offering.dart';
import 'package:creditsea/presentation/widgets/CustomElevatedButton.dart';
import 'package:creditsea/presentation/widgets/CustomText.dart';
import 'package:creditsea/presentation/widgets/custome_elevated_button_two.dart';
import 'package:creditsea/presentation/widgets/custometextformfield.dart';
import 'package:creditsea/utility/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';





class ApplayLoanScreenContainer extends StatelessWidget {
  final PurposeofloanController purposeofloanController =
      Get.put(PurposeofloanController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 1000.h,
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
            offset: const Offset(0, 1),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            h10,
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_back),
                ),
                w10,
                const CustomText(
                  text: 'Apply for loan',
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: const CustomText(
                textAlign: TextAlign.start,
                text:
                    'We’ve calculated your loan eligibility. Select your preferred loan amount and tenure.',
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            h10,
            SizedBox(
              height: 40.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  DashedBorderContainer(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text('Interst Per Day 1%!'),
                    ),
                  ),
                  w10,
                  DashedBorderContainer(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text('Processing  Fee 10%'),
                    ),
                  ),
                ],
              ),
            ),
            h10,
            CustomText(text: 'Purpose of Loan*'),
            h10,
            CustomPurposeFormField(),
            h10,
            LoanAmountSlider(),
            h20,
            LoanTenureSlider(),
            h10,
            InterstContainer(),
            h20,
            CustomText(
                textAlign: TextAlign.center,
                color: Colors.blue,
                fontWeight: FontWeight.w600,
                text:
                    'Thank you for choosing CreditSea. Please accept to proceed with the loan details.'),
            h20,
            CustomElevatedButton(
              height: 50,
              fontSize: 18,
              width: double.infinity,
              text: 'Apply',
              onPressed: () {
                String selectedPurpose =
                    purposeofloanController.selectedPurposeStatus.value;
                print('Selected Purpose: $selectedPurpose');
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OurOfferingScreen()));
              },
            ),
            h20,
            CustomElevatedButtonTwo(
              height: 50,
              width: double.infinity,
              text: "Cancel",
              onPressed: () {},
            ),
            h10,
          ],
        ),
      ),
    );
  }
}

final PurposeofloanController purposeofloanController =
    Get.put(PurposeofloanController());

