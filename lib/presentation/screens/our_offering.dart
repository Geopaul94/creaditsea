import 'package:creditsea/presentation/screens/pan_number/register_headline.dart';
import 'package:creditsea/presentation/screens/personal_details.dart/application_status.dart';
import 'package:creditsea/presentation/widgets/CustomElevatedButton.dart';
import 'package:creditsea/utility/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:creditsea/presentation/widgets/CustomText.dart';
import 'package:creditsea/utility/constants/constants.dart';
import 'package:flutter/material.dart';
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

class conragualtionText extends StatelessWidget {
  const conragualtionText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Congratulations! ',
            style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: 'We can offer you ',
            style: TextStyle(color: Colors.black),
          ),
          TextSpan(
            text: 'Rs. 10,000 ',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: 'Amount Within ',
            style: TextStyle(color: Colors.black),
          ),
          TextSpan(
            text: '30 minutes ',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: 'for 90 days, with a payable amount of ',
            style: TextStyle(color: Colors.black),
          ),
          TextSpan(
            text: 'Rs. 10,600.',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: ' Just with a few more steps.',
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}

class OfferHeadline extends StatelessWidget {
  const OfferHeadline({
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
              backgroundColor: PrimaryColor,
              child: CustomText(
                text: '2',
                color: white,
              ),
            ),
            w10,
            CustomText(
              text: 'offer',
              color: PrimaryColor,
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
                text: '3',
                color: white,
              ),
            ),
            w10,
            CustomText(
              text: 'Approval',
              color: grey,
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
            ),
          ],
        ),
      ],
    );
  }
}

class CustomElevatedButtonTwo extends StatelessWidget {
  final String text;
  final double? height;
  final double? width;
  final VoidCallback? onPressed;

  const CustomElevatedButtonTwo({
    Key? key,
    required this.text,
    this.height = 40.0, // Default height
    this.width = 200.0, // Default width
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        border: Border.all(color: PrimaryColor), // Blue border color
        borderRadius: BorderRadius.circular(8.0), // Rounded corners
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: PrimaryColor,
          backgroundColor: Colors.white, // Text color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0), // Rounded corners
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: black, // Blue text color
          ),
        ),
      ),
    );
  }
}
