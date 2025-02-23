import 'package:creditsea/presentation/screens/offers_screen/congragualtions_text.dart';
import 'package:creditsea/presentation/screens/offers_screen/offer_headline.dart';
import 'package:creditsea/presentation/screens/pan_number/register_headline.dart';
import 'package:creditsea/presentation/screens/application_status/application_status.dart';
import 'package:creditsea/presentation/widgets/CustomElevatedButton.dart';
import 'package:creditsea/presentation/widgets/custome_elevated_button_two.dart';
import 'package:creditsea/utility/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:creditsea/presentation/widgets/CustomText.dart';
// ignore: unnecessary_import
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class OurOfferingScreen extends StatelessWidget {
  const OurOfferingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            h50,
            OfferHeadline(),
            h100,
            CustomText(
              text: 'Our Offerings',
              fontWeight: FontWeight.w600,
              fontSize: 20.sp,
            ),
            h50,
            Center(
              child: Lottie.asset('assets/lotti/rupeeanimation.json',
                  height: 200.h),
            ),
            h20,
            Container(
              width: 260.w,
              child: conragualtionText(),
            ),
            h10,
            CustomText(
              text: 'Proceed further to',
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
            h50,
            CustomElevatedButton(
              text: 'Accept Offer',fontSize: 18,height: 60,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ApplicationStatusScreen(),));
              },
            ),
            h20,
            CustomElevatedButtonTwo(
              text: "Extend Offer",
              onPressed: () {},height: 60.h,width: 320.w,
            ),
            h40,
          ],
        ),
      )),
    );
  }
}
