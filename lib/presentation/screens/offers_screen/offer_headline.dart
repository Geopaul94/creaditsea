
import 'package:creditsea/presentation/screens/pan_number/register_headline.dart';
import 'package:creditsea/presentation/screens/application_status/application_status.dart';
import 'package:creditsea/presentation/widgets/CustomElevatedButton.dart';
import 'package:creditsea/utility/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:creditsea/presentation/widgets/CustomText.dart';
// ignore: unnecessary_import
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

















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
