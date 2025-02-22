import 'package:creditsea/presentation/screens/onBoardingScreens.dart/headline_with_image.dart';
import 'package:creditsea/presentation/widgets/CustomElevatedButton.dart';
import 'package:creditsea/presentation/widgets/CustomText.dart';
import 'package:creditsea/presentation/widgets/custometextformfield.dart';
import 'package:creditsea/utility/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ApplayLoanScreen extends StatelessWidget {
  const ApplayLoanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Row(children: [
                Container(
                  color: PrimaryColor,
                  child: Image.asset(
                    "assets/images/logo.png",
                    height: 75.h,
                    width: 75.w,
                  ),
                ),
                CustomText(
                  text: 'Credit',
                  fontWeight: FontWeight.w500,
                  color: PrimaryColor,
                  fontSize: 35.sp,
                ),
                CustomText(
                  text: 'Sea',
                  fontWeight: FontWeight.w100,
                  color: PrimaryColor,
                  fontSize: 35.sp,
                ),
              ]),
            ),
            Row(
              children: [CustomText(text: 'text')],
            ),
            h50,
            ApplayLoanScreenContainer()
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
      width: double.infinity, height: 1000.h,
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
            offset: const Offset(0, 5),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      padding: const EdgeInsets.all(16.0), // Add padding around the container
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_back),
                ),
                w10,
                const CustomText(
                  text: 'Verify PAN Number',
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
