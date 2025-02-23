import 'package:creditsea/presentation/getx/purposrofloan_controller.dart';
import 'package:creditsea/presentation/screens/onBoardingScreens.dart/headline_with_image.dart';
import 'package:creditsea/presentation/screens/our_offering.dart';
import 'package:creditsea/presentation/widgets/CustomElevatedButton.dart';
import 'package:creditsea/presentation/widgets/CustomText.dart';
import 'package:creditsea/presentation/widgets/custometextformfield.dart';
import 'package:creditsea/utility/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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

class ApplayLoanScreenContainer extends StatelessWidget {
  final PurposeofloanController purposeofloanController =
      Get.put(PurposeofloanController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 1000.h,
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            h10,
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_back),
                ),
                w10,
                const CustomText(
                  text: 'Apply for loan',
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: const CustomText(
                textAlign: TextAlign.start,
                text:
                    'We’ve calculated your loan eligibility. Select your preferred loan amount and tenure.',
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            h10,
            SizedBox(
              height: 40.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  DashedBorderContainer(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text('Interst Per Day 1%!'),
                    ),
                  ),
                  w10,
                  DashedBorderContainer(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text('Processing  Fee 10%'),
                    ),
                  ),
                ],
              ),
            ),
            h10,
            CustomText(text: 'Purpose of Loan*'),
            h10,
            CustomPurposeFormField(),
            h10,
            LoanAmountSlider(),
            h20,
            LoanTenureSlider(),
            h10,
            InterstContainer(),
            h20,
            CustomText(
                textAlign: TextAlign.center,
                color: Colors.blue,
                fontWeight: FontWeight.w600,
                text:
                    'Thank you for choosing CreditSea. Please accept to proceed with the loan details.'),
            h10,
            CustomElevatedButton(
              height: 50,
              fontSize: 18,
              width: double.infinity,
              text: 'Apply',
              onPressed: () {
                String selectedPurpose =
                    purposeofloanController.selectedPurposeStatus.value;
                print('Selected Purpose: $selectedPurpose');
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OurOfferingScreen()));
              },
            ),
            h10,
            CustomElevatedButtonTwo(
              height: 50,
              width: double.infinity,
              text: "Cancel",
              onPressed: () {},
            ),
            h10,
          ],
        ),
      ),
    );
  }
}

final PurposeofloanController purposeofloanController =
    Get.put(PurposeofloanController());

class DashedBorderContainer extends StatelessWidget {
  final Widget child;

  DashedBorderContainer({required this.child});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DashedBorderPainter(),
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: child,
      ),
    );
  }
}

class DashedBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = blueAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round;

    double dashWidth = 4.0;
    double dashSpace = 3.0;
    double startX = 0;

    // Draw top border
    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, 0),
        Offset(startX + dashWidth, 0),
        paint,
      );
      startX += dashWidth + dashSpace;
    }

    startX = 0;

    // Draw right border
    while (startX < size.height) {
      canvas.drawLine(
        Offset(size.width, startX),
        Offset(size.width, startX + dashWidth),
        paint,
      );
      startX += dashWidth + dashSpace;
    }

    startX = 0;

    // Draw bottom border
    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, size.height),
        Offset(startX + dashWidth, size.height),
        paint,
      );
      startX += dashWidth + dashSpace;
    }

    startX = 0;

    // Draw left border
    while (startX < size.height) {
      canvas.drawLine(
        Offset(0, startX),
        Offset(0, startX + dashWidth),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

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

class InterstContainer extends StatelessWidget {
  const InterstContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.blue, // Set the border color to blue
          width: 2, // Set the border width to 2
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween, // Align children to the edges
              children: [
                CustomText(
                  text: "Principal Amount",
                  fontWeight: FontWeight.w700,
                ), // Corrected spelling from "Principle" to "Principal"
                CustomText(
                  text: "₹ 100000",
                  color: Colors.blue,
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
            h10, // Add some spacing between rows
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: "Interest",
                  fontWeight: FontWeight.w700,
                ), // Corrected spelling from "Interst" to "Interest"
                CustomText(
                  text: "1%",
                  color: Colors.blue,
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
            h10, // Add some spacing between rows
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: "Total Payable",
                  fontWeight: FontWeight.w700,
                ),
                CustomText(
                  text: "₹ 2000",
                  color: Colors.blue,
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
