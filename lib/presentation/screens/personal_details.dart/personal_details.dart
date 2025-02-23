import 'package:creditsea/presentation/screens/pan_number/register_headline.dart';
import 'package:creditsea/presentation/screens/personal_details.dart/personal_details_container.dart';
import 'package:creditsea/presentation/widgets/shimmer_effect.dart';
import 'package:creditsea/utility/constants/constants.dart';
import 'package:flutter/material.dart';

String SignInPhoneNumber = '';

class PersonalDetails extends StatefulWidget {
  final String phoneNumber;

  const PersonalDetails({super.key, required this.phoneNumber});

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  bool isLoading = true; // Controls whether to show the shimmer effect

  @override
  void initState() {
    super.initState();
    // Set SignInPhoneNumber globally
    SignInPhoneNumber = widget.phoneNumber;

    // Simulate a delay of 1.5 seconds
    Future.delayed(const Duration(milliseconds: 1500), () {
      setState(() {
        isLoading = false; // Stop showing the shimmer effect
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              if (isLoading)
                ShimmerEffect() // Show shimmer effect while loading
              else
                Column(
                  children: [
                    h60,
                    RegisterHeadline(),
                    h30,
             
                    PersonalDetailsContainer(),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

