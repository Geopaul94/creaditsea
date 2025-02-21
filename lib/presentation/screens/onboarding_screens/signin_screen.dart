import 'package:creditsea/presentation/screens/onBoardingScreens.dart/headline_with_image.dart';
import 'package:creditsea/presentation/screens/onBoardingScreens.dart/icon_big_container.dart';
import 'package:creditsea/presentation/screens/onBoardingScreens.dart/icon_container.dart';
import 'package:creditsea/presentation/screens/onBoardingScreens.dart/tick_container.dart';
import 'package:creditsea/presentation/screens/onboarding_screens/welcome_screen.dart';
import 'package:creditsea/presentation/widgets/CustomElevatedButton.dart';
import 'package:creditsea/presentation/widgets/CustomText.dart';
import 'package:creditsea/presentation/widgets/customepassword.dart';
import 'package:creditsea/presentation/widgets/custometextformfield.dart';
import 'package:creditsea/utility/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PrimaryColor,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              h30,
              Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Headlinewithimage(),
                ],
              )),
              h30,
              IconBigContainer(
                centerImage: 'assets/images/thirdscreen_agent.png',
              ),
              CustomText(
                text: '24*7 Customer Care ',
                color: white,
                fontWeight: FontWeight.w600,
                fontSize: 18.sp,
              ),
              CustomText(
                text: 'Dedicated Customer Support team  ',
                color: white,
                fontWeight: FontWeight.w300,
                fontSize: 14.sp,
              ),
              h40,
              SigninScreenContainer(),
            ],
          ),
        ),
      ),
    );
  }
}

class SigninScreenContainer extends StatefulWidget {
  const SigninScreenContainer({super.key});

  @override
  State<SigninScreenContainer> createState() => _SigninScreenContainerState();
}

class _SigninScreenContainerState extends State<SigninScreenContainer> {
  final TextEditingController _phonenumber = TextEditingController();
  final TextEditingController _passwordcontoller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double availableHeight = size.height - 430; // Assuming top is at 430

    return SingleChildScrollView(
      child: Container(
        height: 500.h, // Set a specific height for visibility
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
                    text: "Please enter your credentails",
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
                        hintText: 'Please enter your mobile no',
                      ),
                    ),
                  ],
                ),
                h10,

                CustomPasswordTextformField(
                    controller: _passwordcontoller,
                    labelText: 'Enter password '),

                h20,
                Center(
                    child: CustomElevatedButton(
                        width: double.infinity,
                        text: 'Sign in',
                        onPressed: () {})),
                    h5,    Row(
                          children: [
                           Spacer(), CustomText(text: 'Forgot passowrd ?',color: PrimaryColor,),
                          ],
                        ),

                h10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: 'New to creditSea ? ',
                      color: PrimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WelcomeScreen()),
                          );
                        },
                        child: CustomText(
                          text: 'Create and account',
                          color: PrimaryColor,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),h30,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
