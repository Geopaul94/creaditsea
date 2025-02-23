
import 'package:creditsea/presentation/getx/otp_timer/password_update.dart';
import 'package:creditsea/presentation/screens/signup_screen/welcome_screen.dart';
import 'package:creditsea/presentation/widgets/CustomElevatedButton.dart';
import 'package:creditsea/presentation/widgets/CustomText.dart';
import 'package:creditsea/presentation/widgets/customepassword.dart';

import 'package:creditsea/utility/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
















class ONbordingScreenThreeContainer extends StatelessWidget {
  final String phoneNumber;


  ONbordingScreenThreeContainer({super.key, required this.phoneNumber});

  final PasswordController _controller = Get.put(PasswordController());
  @override
  Widget build(BuildContext context) {
  final PasswordController _controller = Get.put(PasswordController());
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
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
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WelcomeScreen()),
                        );
                      },
                    ),
                    w40,
                    CustomText(
                      text: "Create a password ",
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                h10,
                CustomText(
                  text: 'Enter password',
                  color: black,
                ),
                h5,
                CustomPasswordTextformField(
               controller: _controller.passwordController,
                    labelText: 'Enter password '),
                h10,
                CustomText(
                  text: 'Re enter password',
                  color: black,
                ),
                h5,
                CustomPasswordTextformField(
                    controller:_controller.confirmpasswordController ,
                    labelText: 'Re enter password '),
                h10,
                CustomText(
                  text:
                      '* your password must include at least 8 characters, inclusive of at least one specail character ',
                  color: grey,
                ),
                h20,
                Obx(() {
                  return _controller.isLoading.value
                      ? Center(child: const CircularProgressIndicator())
                      : Center(
                          child: CustomElevatedButton(
                            width: double.infinity,
                            text: 'Proceed',
                            onPressed: () {
                              _controller.updatePassword(context, phoneNumber);
                            },
                          ),
                        );
                }),
                h40,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

