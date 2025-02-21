import 'package:flutter/material.dart';

class ResponsiveHelper {
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static Orientation getScreenOrientation(BuildContext context) {
    return MediaQuery.of(context).orientation;
  }

  // Add more methods to get other properties like devicePixelRatio, padding, etc.
}
