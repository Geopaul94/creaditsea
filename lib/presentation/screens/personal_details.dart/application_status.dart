import 'package:creditsea/presentation/screens/our_offering.dart';
import 'package:flutter/material.dart';
import 'package:creditsea/presentation/screens/pan_number/register_headline.dart';
import 'package:creditsea/presentation/widgets/CustomElevatedButton.dart';
import 'package:creditsea/utility/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:creditsea/presentation/widgets/CustomText.dart';
import 'package:creditsea/utility/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ApplicationStatusScreen extends StatelessWidget {
  const ApplicationStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(backgroundColor: white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            h50,
            ApprovalHeadline(),
            h40,
            ApplayLoanScreenContainer(),
          ],
        ),
      )),
    );
  }
}

class ApplayLoanScreenContainer extends StatefulWidget {
  const ApplayLoanScreenContainer({super.key});

  @override
  _ApplayLoanScreenContainerState createState() =>
      _ApplayLoanScreenContainerState();
}

class _ApplayLoanScreenContainerState extends State<ApplayLoanScreenContainer> {
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
            ),h20,
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
                onPressed: () {})
          ],
        ),
      ),
    );
  }
}

class VerticalLineContainer extends StatelessWidget {
  const VerticalLineContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 2.0,
      height: 20.h,
      color: Colors.black,
    );
  }
}

class CustomApplicationStatusContainer extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor; // Change this to Color for simplicity

  const CustomApplicationStatusContainer({
    Key? key,
    required this.text,
    required this.color,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              width: 2,
              color: color,
            ), // Correctly set the border color
          ),
          width: double.infinity, // Set the width using ScreenUtil
          height: 50.h, // Set the height using ScreenUtil
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.start, // Align items to the start
              children: [
                Icon(Icons.notes_rounded),
                Expanded(
                  child: Center(
                    child: Text(
                      text,
                      style: TextStyle(
                          color: textColor,
                          fontWeight:
                              FontWeight.w700), // Use the textColor directly
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ApprovalHeadline extends StatelessWidget {
  const ApprovalHeadline({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 14.r,
              backgroundColor: grey,
              child: CustomText(
                text: '1',
                color: white,
              ),
            ),
            w10,
            CustomText(
              text: 'Register',
              color: grey,
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
            ),
          ],
        ),
        w10,
        Row(
          children: [
            CircleAvatar(
              radius: 14.r,
              backgroundColor: grey,
              child: CustomText(
                text: '2',
                color: white,
              ),
            ),
            w10,
            CustomText(
              text: 'offer',
              color: grey,
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
            ),
          ],
        ),
        w10,
        Row(
          children: [
            CircleAvatar(
              radius: 14.r,
              backgroundColor: PrimaryColor,
              child: CustomText(
                text: '3',
                color: white,
              ),
            ),
            w10,
            CustomText(
              text: 'Approval',
              color: PrimaryColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
            ),
          ],
        ),
      ],
    );
  }
}
