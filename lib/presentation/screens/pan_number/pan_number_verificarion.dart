import 'package:creditsea/presentation/widgets/CustomElevatedButton.dart';
import 'package:creditsea/presentation/widgets/CustomText.dart';
import 'package:creditsea/presentation/widgets/custometextformfield.dart';
import 'package:creditsea/utility/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PanNumberVerificationScreen extends StatelessWidget {
  const PanNumberVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [CustomText(text: 'text')],
            ),
            h50,
            PanNumberVerificationScreenContainer()
          ],
        ),
      )),
    );
  }
}

class PanNumberVerificationScreenContainer extends StatefulWidget {
  const PanNumberVerificationScreenContainer({super.key});

  @override
  _PanNumberVerificationScreenContainerState createState() =>
      _PanNumberVerificationScreenContainerState();
}

class _PanNumberVerificationScreenContainerState
    extends State<PanNumberVerificationScreenContainer> {
  final TextEditingController _PanNumbercontroller = TextEditingController();

  @override
  void dispose() {
    _PanNumbercontroller.dispose();

    super.dispose();
  }

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
          Image.asset(
            'assets/images/pannumber.png',
            height: 200.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'Enter Your PAN Number*',
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                h20,
                CustomTextFormField(
                  labelText: 'Enter your PanNumber ID',
                  controller: _PanNumbercontroller,
                ),
              ],
            ),
          ),
          h100,
          h100,
          h50,
          h20,
          CustomElevatedButton(
            borderRadius: 10,
            height: 50.h,
            fontSize: 20.sp,
            text: 'Continue',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}






