import 'package:creditsea/data/repository/phonenumber_authentication.dart';
import 'package:creditsea/firebase_options.dart';
import 'package:creditsea/presentation/getx/user_controller.dart';
import 'package:creditsea/presentation/sample/s.dart';
import 'package:creditsea/presentation/screens/applay_loan/applay_loan.dart';
import 'package:creditsea/presentation/screens/onboarding_screens/onboarding_screen_two.dart';
import 'package:creditsea/presentation/screens/onboarding_screens/welcome_screen.dart';

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
          home: WelcomeScreen(),
        );
      },
    );
  }
}

class FirstScreen extends StatelessWidget {
  final _phoneController = TextEditingController();
  final UserController _userController =
      Get.put(UserController()); // Initialize the controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phone Number Validation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Enter Phone Number',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Obx(() {
              // Show circular progress indicator when loading
              return _userController.isLoading.value
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () {
                        // Call the processPhoneNumber function and pass the BuildContext
                        _userController.processPhoneNumber(
                            context, _phoneController.text.trim());
                      },
                      child: Text('Next'),
                    );
            }),
          ],
        ),
      ),
    );
  }
}
