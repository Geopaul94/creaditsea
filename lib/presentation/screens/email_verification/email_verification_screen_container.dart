import 'package:creditsea/presentation/getx/email_controller/email_controller.dart';
import 'package:creditsea/presentation/getx/email_controller/emailotp_controller.dart';
import 'package:creditsea/presentation/screens/email_verification/email_verification_otp.dart';
import 'package:creditsea/presentation/screens/onboarding_screen_two/otp_input_container.dart';
import 'package:creditsea/presentation/screens/pan_number/register_headline.dart';
import 'package:creditsea/presentation/widgets/CustomElevatedButton.dart';
import 'package:creditsea/presentation/widgets/CustomText.dart';
import 'package:creditsea/presentation/widgets/custometextformfield.dart';
import 'package:creditsea/utility/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EmailVerificationScreenContainer extends StatelessWidget {
  EmailVerificationScreenContainer({super.key});

  final EmailController emailController = Get.put(EmailController());
  final EmailotpController emailotpController = Get.put(EmailotpController());
  @override
  Widget build(BuildContext context) {
    return Container(
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
                  text: 'Personal Email ID',
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
          ),
          h15,
          Image.asset('assets/images/email.png'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'Email ID*',
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                h10,
                CustomTextFormField(
                  labelText: 'Enter your email ID',
                  controller: emailController.emailController,
                ),
                h20,
                Obx(() {
                  return emailController.isLoading.value
                      ? const Center(child: CircularProgressIndicator())
                      : CustomElevatedButton(
                          paddingHorizontal: 4,
                          paddingVertical: 2,
                          borderRadius: 10,
                          height: 35.h,
                          fontSize: 14.sp,
                          text: 'Request OTP',
                          onPressed: () {
                            emailController.requestOTP(context);
                          },
                        );
                }),
              ],
            ),
          ),
          EmailOTPVerificationContainer(),
        ],
      ),
    );
  }
}
