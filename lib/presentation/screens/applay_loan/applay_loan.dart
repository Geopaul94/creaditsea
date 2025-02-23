import 'package:creditsea/presentation/screens/applay_loan/applay_loan_screen_container.dart';
import 'package:creditsea/presentation/widgets/CustomText.dart';
import 'package:creditsea/utility/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ApplayLoanScreen extends StatelessWidget {
  const ApplayLoanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              h20,
              Center(
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Center the Row's children
                  children: [
                    Image.asset(
                      "assets/images/logo2.png",
                      height: 75.h,
                      width: 75.w,
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
                  ],
                ),
              ),
              h10,
              ApplayLoanScreenContainer()
            ],
          ),
        ),
      )),
    );
  }
}
