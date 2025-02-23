import 'package:creditsea/presentation/getx/sign_in_controller/signin_controller.dart';

import 'package:creditsea/presentation/screens/signup_screen/welcome_screen.dart';
import 'package:creditsea/presentation/widgets/CustomElevatedButton.dart';
import 'package:creditsea/presentation/widgets/CustomText.dart';
import 'package:creditsea/presentation/widgets/customepassword.dart';
import 'package:creditsea/presentation/widgets/custometextformfield.dart';
import 'package:creditsea/utility/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SigninScreenContainer extends StatefulWidget {
  const SigninScreenContainer({super.key});

  @override
  State<SigninScreenContainer> createState() => _SigninScreenContainerState();
}

class _SigninScreenContainerState extends State<SigninScreenContainer> {
  final SigninController _controller = Get.put(SigninController());
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

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
                            h10,
                            CustomText(text: '+91'),
                          ],
                        ),
                      ),
                    ),
                    w10,
                    Expanded(
                      child: CustomTextFormField(
                        keyboardType: TextInputType.phone,
                        labelText: 'Phone Number',
                        controller: _controller.phoneNumberController,
                        hintText: 'Please enter your mobile no',
                      ),
                    ),
                  ],
                ),
                h10,

                CustomPasswordTextformField(
                    controller: _controller.passwordController,
                    labelText: 'Enter password '),

                h20,
                Obx(() {
                  // Show loading indicator if isLoading is true
                  return _controller.isLoading.value
                      ? Center(child: CircularProgressIndicator())
                      : Center(
                          child: CustomElevatedButton(
                            width: double.infinity,
                            text: 'Sign in',
                            onPressed: () {
                              // Call the signIn method from the controller
                              _controller.signIn(context);
                            },
                          ),
                        );
                }),
                h5,
                Row(
                  children: [
                    Spacer(),
                    CustomText(
                      text: 'Forgot password ?',
                      color: PrimaryColor,
                    ),
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


                          _controller.clearFields();
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
                ),
                h30,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
