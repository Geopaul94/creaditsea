import 'package:creditsea/presentation/getx/user_controller.dart';
import 'package:creditsea/presentation/screens/onBoardingScreens.dart/headline_with_image.dart';
import 'package:creditsea/presentation/screens/onBoardingScreens.dart/icon_container.dart';
import 'package:creditsea/presentation/screens/onBoardingScreens.dart/tick_container.dart';
import 'package:creditsea/presentation/screens/onboarding_screen_two/onboarding_screen_two.dart';
import 'package:creditsea/presentation/screens/onboarding_screen_two/signin_screen.dart';
import 'package:creditsea/presentation/widgets/CustomElevatedButton.dart';
import 'package:creditsea/presentation/widgets/CustomText.dart';
import 'package:creditsea/presentation/widgets/custometextformfield.dart';
import 'package:creditsea/presentation/widgets/validations%20.dart';
import 'package:creditsea/utility/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PrimaryColor,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              h20,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Headlinewithimage(),
                ],
              ),
              h20,
              Iconcontainer(
                color: const Color.fromARGB(120, 89, 94, 146),
              ),
              h20,
              CustomText(
                text: 'Flexible loan options ',
                color: white,
                fontWeight: FontWeight.w600,
                fontSize: 18.sp,
              ),
              h5,
              CustomText(
                text: 'Loan types to cater to differnt financial needs  ',
                color: white,
                fontWeight: FontWeight.w300,
                fontSize: 14.sp,
              ),
              h10,
             ThreeDotShape(index: 0), 
      
              h10,
              WelcomeScreenContainer()
            ],
          ),
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
  final UserController _userController =
      Get.put(UserController()); // Initialize the controller

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Container(
          height: 600.h,
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
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1.0),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            children: [
                              Image.asset('assets/images/India.png'),
                              SizedBox(width: 10),
                              CustomText(text: '+91'),
                            ],
                          ),
                        ),
                      ),
                      w10,
                      Expanded(
                        child: TextField(
                          controller: _phonenumber,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            labelText: 'Enter Phone Number',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
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

                  Obx(() {
                    // Show circular progress indicator when loading
                    return _userController.isLoading.value
                        ? Center(child: CircularProgressIndicator())
                        : Center(
                            child: CustomElevatedButton(
                                width: double.infinity,
                                text: 'Request OTP',
                                onPressed: () {
                                  _userController.processPhoneNumber(
                                      context, _phonenumber.text.trim());
                                }),
                          );
                  }),

                  h40,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: 'Existing User? ',
                        color: PrimaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SigninScreen()),
                            );
                          },
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
      ),
    );
  }
}








class ThreeDotShape extends StatelessWidget {
  final int index;

  ThreeDotShape({required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // First shape
        _buildShape(0),
        SizedBox(width: 10), // Space between shapes
        // Second shape
        _buildShape(1),
        SizedBox(width: 10), // Space between shapes
        // Third shape
        _buildShape(2),
      ],
    );
  }

  Widget _buildShape(int shapeIndex) {
    if (shapeIndex == index) {
      // Return square for the specified index
      return Container(
        width: 25, // Increased width for the square
        height: 10, // Increased height for the square
        decoration: BoxDecoration(
          color: Colors.white, // White background
          border: Border.all(
            color: Colors.blue, // Border color
            width: 1, // Border width
          ),
          borderRadius: BorderRadius.circular(5), // Rounded corners
        ),
      );
    } else {
      // Return circle for other indices
      return Container(
        width: 10, // Circle diameter
        height: 10, // Circle diameter
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blue, // Blue color for circles
        ),
      );
    }
  }
}
