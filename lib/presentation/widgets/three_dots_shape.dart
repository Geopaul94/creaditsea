
import 'package:flutter/material.dart';


class ThreeDotShape extends StatelessWidget {
  final int index;

  ThreeDotShape({required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // First shape
        _buildShape(0),
        SizedBox(width: 10), // Space between shapes
        // Second shape
        _buildShape(1),
        SizedBox(width: 10), // Space between shapes
        // Third shape
        _buildShape(2),
      ],
    );
  }

  Widget _buildShape(int shapeIndex) {
    if (shapeIndex == index) {
      // Return square for the specified index
      return Container(
        width: 25, // Increased width for the square
        height: 10, // Increased height for the square
        decoration: BoxDecoration(
          color: Colors.white, // White background
          border: Border.all(
            color: Colors.blue, // Border color
            width: 1, // Border width
          ),
          borderRadius: BorderRadius.circular(5), // Rounded corners
        ),
      );
    } else {
      // Return circle for other indices
      return Container(
        width: 10, // Circle diameter
        height: 10, // Circle diameter
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blue, // Blue color for circles
        ),
      );
    }
  }
}
