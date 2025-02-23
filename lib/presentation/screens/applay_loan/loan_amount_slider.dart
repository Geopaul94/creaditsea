



import 'package:creditsea/presentation/getx/purposeloan_controller/purposrofloan_controller.dart';
import 'package:creditsea/presentation/screens/onBoardingScreens.dart/headline_with_image.dart';
import 'package:creditsea/presentation/screens/offers_screen/our_offering.dart';
import 'package:creditsea/presentation/widgets/CustomElevatedButton.dart';
import 'package:creditsea/presentation/widgets/CustomText.dart';
import 'package:creditsea/presentation/widgets/custometextformfield.dart';
import 'package:creditsea/utility/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';






class LoanAmountSlider extends StatefulWidget {
  @override
  _LoanAmountSliderState createState() => _LoanAmountSliderState();
}

class _LoanAmountSliderState extends State<LoanAmountSlider> {
  // Variables for the slider
  double _currentValue = 5000; // Initial value of the slider
  final double _minValue = 1000; // Minimum loan amount
  final double _maxValue = 100000; // Maximum loan amount

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row for Label and Amount
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: 'Principal Amount',
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
              Text(
                '\ ₹ ${_currentValue.toStringAsFixed(0)}', // Display current value
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: PrimaryColor,
                ),
              ),
            ],
          ),
          h10,
          // Slider
          Slider(
            value: _currentValue,
            min: _minValue,
            max: _maxValue,
            divisions: ((_maxValue - _minValue) ~/ 1000), // Optional: Step size
            activeColor: PrimaryColor, // Active part of the slider
            inactiveColor: Colors.grey[300], // Inactive part of the slider
            onChanged: (double newValue) {
              setState(() {
                _currentValue = newValue; // Update the slider value
              });
            },
          ),
        ],
      ),
    );
  }
}
