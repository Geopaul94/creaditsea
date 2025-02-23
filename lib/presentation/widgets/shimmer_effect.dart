import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                // Use Expanded to constrain the width
                child: Container(
                  height: 20,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            height: 20,
            width: 200, // Use a fixed width instead of 200.w
            color: Colors.white,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                // Use Expanded to constrain the width
                child: Container(
                  height: 30,
                  color: Colors.white,
                ),
              ),
              Expanded(
                // Use Expanded to constrain the width
                child: Container(
                  height: 30,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                // Use Expanded to constrain the width
                child: Container(
                  height: 40,
                  color: Colors.white,
                ),
              ),
              Expanded(
                // Use Expanded to constrain the width
                child: Container(
                  height: 40,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            height: 20,
            width: double.infinity, // This is fine as it is
            color: Colors.white,
          ),
          Row(
            children: [
              Expanded(
                // Use Expanded to constrain the width
                child: Container(
                  height: 40,
                  color: Colors.white,
                ),
              ),
              Expanded(
                // Use Expanded to constrain the width
                child: Container(
                  height: 40,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            height: 20,
            width: double.infinity, // This is fine as it is
            color: Colors.white,
          ),
          Row(
            children: [
              Expanded(
                // Use Expanded to constrain the width
                child: Container(
                  height: 40,
                  color: Colors.white,
                ),
              ),
              Expanded(
                // Use Expanded to constrain the width
                child: Container(
                  height: 40,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 200), // Adjusted spacing
          Container(
            height: 40,
            width: double.infinity, // This is fine as it is
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
