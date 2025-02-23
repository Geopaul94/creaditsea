import 'package:creditsea/presentation/widgets/CustomText.dart';
import 'package:creditsea/utility/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterHeadline extends StatelessWidget {
  const RegisterHeadline({
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
              backgroundColor: PrimaryColor,
              child: CustomText(
                text: '1',
                color: white,
              ),
            ),
            w10,
            CustomText(
              text: 'Register',
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
