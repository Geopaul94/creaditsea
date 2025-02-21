import 'package:creditsea/presentation/screens/onBoardingScreens.dart/headline_with_image.dart';
import 'package:creditsea/presentation/screens/onBoardingScreens.dart/icon_container.dart';
import 'package:creditsea/presentation/screens/onBoardingScreens.dart/tick_container.dart';
import 'package:creditsea/presentation/widgets/CustomElevatedButton.dart';
import 'package:creditsea/presentation/widgets/CustomText.dart';
import 'package:creditsea/presentation/widgets/custometextformfield.dart';
import 'package:creditsea/utility/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PrimaryColor,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(top: 40.h, left: 80.w, child: Headlinewithimage()),
            Positioned(
                top: 130.h,
                left: 110.w,
                child: Iconcontainer(
                  color: const Color.fromARGB(120, 89, 94, 146),
                )),
            Positioned(
              top: 330.h,
              left: 115.w,
              child: CustomText(
                text: 'Flexible loan options ',
                color: white,
                fontWeight: FontWeight.w600,
                fontSize: 18.sp,
              ),
            ),
            Positioned(
              top: 360.h,
              left: 60.w,
              child: CustomText(
                text: 'Loan types to cater to differnt financial needs  ',
                color: white,
                fontWeight: FontWeight.w300,
                fontSize: 14.sp,
              ),
            ),
            Positioned(top: 420.h, left: 0.w, child: WelcomeScreenContainer()),
          ],
        ),
      ),
    );
  }
}

class WelcomeScreenContainer extends StatefulWidget {
  const WelcomeScreenContainer({super.key});

  @override
  State<WelcomeScreenContainer> createState() => _WelcomeScreenContainerState();
}

class _WelcomeScreenContainerState extends State<WelcomeScreenContainer> {
  final TextEditingController _phonenumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double availableHeight = size.height - 430; // Assuming top is at 430

    return SingleChildScrollView(
      child: Container(
        height: availableHeight, // Set a specific height for visibility
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          gradient: const LinearGradient(
            colors: [
              Color(0xFF0075FF),
              Color(0xFF00A676),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Container(
          margin: const EdgeInsets.only(top: 7.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                h20,
                Center(
                  child: CustomText(
                    text: "Welcome to Credit Sea!",
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                h10, //
                CustomText(
                  text: "Mobile Number",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
                h10,
                Container(
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.grey, width: 1.0), // Grey border
                          borderRadius: BorderRadius.circular(
                              8.0), // Optional: rounded corners
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            children: [
                              Image.asset('assets/images/India.png'),
                              SizedBox(width: 10), // Use SizedBox for spacing
                              CustomText(text: '+91'),
                            ],
                          ),
                        ),
                      ),
                      w10,
                      Expanded(
                        child: CustomTextFormField(
                          labelText: 'Phone Number', // Updated label
                          controller: _phonenumber,
                          // decoration: InputDecoration(
                          //   border: OutlineInputBorder(),
                          hintText: 'Please enter your mobil',
                        ),
                      ),
                    ],
                  ),
                ),
                h10,

                Row(
                  children: [
                    TickContainerScreen(),
                    w20,
                    Expanded(
                      child: Text.rich(
                        TextSpan(
                          style: TextStyle(fontSize: 16),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'By continuing, you agree to our ',
                              style: TextStyle(fontSize: 14.sp, color: grey),
                            ),
                            TextSpan(
                              text: 'privacy policies',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: const Color.fromARGB(255, 82, 75, 75),
                                fontSize: 14.sp,
                              ),
                            ),
                            TextSpan(
                              text: ' and ',
                              style: TextStyle(
                                color: grey,
                                fontSize: 14.sp,
                              ),
                            ),
                            TextSpan(
                              text: 'Terms & Conditions',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: const Color.fromARGB(255, 82, 75, 75),
                                fontSize: 14.sp,
                              ),
                            ),
                            TextSpan(text: '.'),
                          ],
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
                h20,
                Center(
                    child: CustomElevatedButton(
                        width: double.infinity,
                        text: 'Request OTP',
                        onPressed: () {})),

                h10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: 'Existing User? ',
                      color: PrimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                    GestureDetector(
                        child: CustomText(
                      text: 'Sign in',
                      color: PrimaryColor,
                      fontWeight: FontWeight.bold,
                    )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
