




import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';






class CustomApplicationStatusContainer extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor; // Change this to Color for simplicity

  const CustomApplicationStatusContainer({
    Key? key,
    required this.text,
    required this.color,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              width: 2,
              color: color,
            ), // Correctly set the border color
          ),
          width: double.infinity, // Set the width using ScreenUtil
          height: 50.h, // Set the height using ScreenUtil
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.start, // Align items to the start
              children: [
                Icon(Icons.notes_rounded),
                Expanded(
                  child: Center(
                    child: Text(
                      text,
                      style: TextStyle(
                          color: textColor,
                          fontWeight:
                              FontWeight.w700), // Use the textColor directly
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

