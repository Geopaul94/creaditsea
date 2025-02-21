
import 'package:creditsea/presentation/widgets/CustomText.dart';
import 'package:creditsea/utility/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Headlinewithimage extends StatelessWidget {
  const Headlinewithimage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: [
        Image.asset(
          "assets/images/logo.png",
          height: 75.h,
          width: 75.w,
        ),
        CustomText(
          text: 'Credit',
          fontWeight: FontWeight.w500,
          color: white,
          fontSize: 35.sp,
        ),
        CustomText(
          text: 'Sea',
          fontWeight: FontWeight.w100,
          color: white,
          fontSize: 35.sp,
        ),
      ]),
    );
  }
}