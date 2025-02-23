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
class LoanTenureSlider extends StatefulWidget {
  @override
  _LoanTenureSliderState createState() => _LoanTenureSliderState();
}

class _LoanTenureSliderState extends State<LoanTenureSlider> {
  // Variables for the slider
  double _currentValue = 20; // Initial value of the slider (in days)
  final double _minValue = 20; // Minimum tenure in days
  final double _maxValue = 45; // Maximum tenure in days

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
              Text(
                'Tenure',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${_currentValue.toStringAsFixed(0)} days', // Display current value
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: PrimaryColor, // Use your PrimaryColor here
                ),
              ),
            ],
          ),
          const SizedBox(height: 10), // Space between label and slider
          // Slider
          Slider(
            value: _currentValue,
            min: _minValue,
            max: _maxValue,
            //  divisions: (_maxValue - _minValue).toInt(), // Step size
            activeColor: PrimaryColor, // Active part of the slider
            inactiveColor: Colors.grey[300], // Inactive part of the slider
            onChanged: (double newValue) {
              setState(() {
                _currentValue = newValue; // Update the slider value
              });
            },
          ),
          // Static days below the slider
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: '20 days',
                fontSize: 16,
                color: grey,
              ),
              CustomText(
                text: '45 days',
                fontSize: 16,
                color: grey,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
