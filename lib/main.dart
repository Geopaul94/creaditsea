
import 'package:creditsea/presentation/screens/onboarding_screens/onboarding_screen_two.dart';
import 'package:creditsea/presentation/screens/splash_screen.dart';
import 'package:creditsea/presentation/screens/ss.dart';
import 'package:creditsea/presentation/screens/onboarding_screens/welcome_screen.dart';
import 'package:creditsea/sample/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
      //  options: DefaultFirebaseOptions.currentPlatform,
    //  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(392, 802),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(debugShowCheckedModeBanner: false,
          title: 'credit sea ',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: ONbordingScreenTwo(),
        );
      },
    );
  }
}

