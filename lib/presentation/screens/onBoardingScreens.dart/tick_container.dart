import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TickContainerScreen extends StatefulWidget {
  const TickContainerScreen({super.key});

  @override
  _TickContainerScreenState createState() => _TickContainerScreenState();
}

class _TickContainerScreenState extends State<TickContainerScreen> {
  bool isTicked = true;

  void _toggleTick() {
    setState(() {
      isTicked = !isTicked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleTick,
      child: Container(
        width: 30.h,
        height: 30.h,
        decoration: BoxDecoration(
          color: isTicked
              ? const Color.fromARGB(255, 17, 168, 22)
              : const Color.fromARGB(97, 26, 27, 26), // Change background color
          border: Border.all(
            color: isTicked
                ? Colors.white
                : Colors.transparent, // Change border color
            width: 2,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: isTicked
              ? Icon(Icons.check, color: Colors.white) // Show tick icon
              : null, // No icon when unticked
        ),
      ),
    );
  }
}
