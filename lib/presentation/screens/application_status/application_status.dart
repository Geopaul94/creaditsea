import 'package:creditsea/presentation/screens/applay_loan/applay_loan_screen_container.dart';
import 'package:creditsea/presentation/screens/application_status/application_loanscreen_container.dart';
import 'package:creditsea/presentation/screens/application_status/approoval_headline.dart';
import 'package:flutter/material.dart';
import 'package:creditsea/utility/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:creditsea/utility/constants/constants.dart';
import 'package:flutter/material.dart';

class ApplicationStatusScreen extends StatelessWidget {
  const ApplicationStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            h50,
            const ApprovalHeadline(),
            h40,
            ApplayLoanStatusScreenContainer(),
          ],
        ),
      )),
    );
  }
}

