import 'package:creditsea/presentation/screens/pan_number/pan_card_verifcation_container.dart';
import 'package:creditsea/presentation/screens/pan_number/register_headline.dart';
import 'package:creditsea/utility/constants/constants.dart';
import 'package:flutter/material.dart';

class PanNumberVerificationScreen extends StatelessWidget {
  const PanNumberVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            h40,
            w10,
            RegisterHeadline(),
            h30,
            PanNumberVerificationScreenContainer()
          ],
        ),
      )),
    );
  }
}

