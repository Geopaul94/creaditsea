import 'package:creditsea/presentation/screens/application_status/custome_application_status.dart';
import 'package:creditsea/presentation/screens/offers_screen/our_offering.dart';
import 'package:creditsea/presentation/screens/signin_screen/signin_screen.dart';
import 'package:creditsea/presentation/widgets/vertical_line_container.dart';
import 'package:flutter/material.dart';
import 'package:creditsea/presentation/widgets/CustomElevatedButton.dart';
import 'package:creditsea/utility/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:creditsea/presentation/widgets/CustomText.dart';
import 'package:creditsea/utility/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class ApplayLoanStatusScreenContainer extends StatefulWidget {
  const ApplayLoanStatusScreenContainer({super.key});

  @override
  _ApplayLoanScreenContainerState createState() =>
      _ApplayLoanScreenContainerState();
}

class _ApplayLoanScreenContainerState
    extends State<ApplayLoanStatusScreenContainer> {
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OurOfferingScreen(),
                        ));
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
                w10,
                const CustomText(
                  text: 'Application Status',
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
            Row(
              children: [
                w10,
                CustomText(
                  text: 'Loan application no.',
                  color: const Color.fromARGB(255, 46, 44, 44),
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                ),
                CustomText(
                  text: '#CS12323',
                  color: black,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
            h20,
            CustomApplicationStatusContainer(
              text: 'Application submitted',
              color: green,
              textColor: green,
            ),
            VerticalLineContainer(),
            CustomApplicationStatusContainer(
              text: 'Application Under Review',
              color: PrimaryColor,
              textColor: PrimaryColor,
            ),
            VerticalLineContainer(),
            CustomApplicationStatusContainer(
              text: 'E-KYC',
              color: grey,
              textColor: grey,
            ),
            VerticalLineContainer(),
            CustomApplicationStatusContainer(
              text: 'E-Nach',
              color: grey,
              textColor: grey,
            ),
            VerticalLineContainer(),
            CustomApplicationStatusContainer(
              text: 'E-Sign',
              color: grey,
              textColor: grey,
            ),
            VerticalLineContainer(),
            CustomApplicationStatusContainer(
              text: 'Disbursement',
              color: grey,
              textColor: grey,
            ),
            h30,
            Image.asset('assets/images/applicationunderreview.png'),
            h10,
            CustomText(
              text: 'Application Under Review',
              fontWeight: FontWeight.w700,
              fontSize: 18.sp,
            ),
            CustomText(
                textAlign: TextAlign.center,
                text:
                    'We’re carefully reviewing your application to ensure everything is in order. Thank you for your patience.'),
            h40,
            CustomElevatedButton(
                width: double.infinity,
                height: 50,
                fontSize: 18,
                text: 'Continue',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SigninScreen(),
                      ));
                })
          ],
        ),
      ),
    );
  }
}
