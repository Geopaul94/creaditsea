import 'package:creditsea/presentation/screens/email_verification/email_verification_screen_container.dart';
import 'package:creditsea/presentation/screens/pan_number/register_headline.dart';
import 'package:creditsea/utility/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmailVerificationScreen extends StatelessWidget {
  const EmailVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            h60,
            RegisterHeadline(),
            h30,
            EmailVerificationScreenContainer()
          ],
        ),
      )),
    );
  }
}
