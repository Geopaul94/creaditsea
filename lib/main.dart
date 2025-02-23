
import 'package:creditsea/firebase_options.dart';
import 'package:creditsea/presentation/screens/applay_loan/applay_loan.dart';
import 'package:creditsea/presentation/screens/onboarding_screen_two/signin_screen.dart';
import 'package:creditsea/presentation/screens/our_offering.dart';
import 'package:creditsea/presentation/screens/pan_number/pan_number_verificarion.dart';
import 'package:creditsea/presentation/screens/personal_details.dart/email_verification_screen.dart';
import 'package:creditsea/presentation/screens/personal_details.dart/personal_details.dart';
import 'package:creditsea/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

import 'package:get/get_navigation/src/root/get_material_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    // Get.put(GlobalController());
    return ScreenUtilInit(
      designSize: const Size(392, 802),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'credit sea ',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: OurOfferingScreen(),
        );
      },
    );
  }
}

