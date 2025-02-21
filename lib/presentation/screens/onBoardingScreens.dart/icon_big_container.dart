import 'package:creditsea/utility/constants/constants.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class IconBigContainer extends StatelessWidget {
  final String centerImage; // Change type to String
  final String sideImage; // Change type to String

  const IconBigContainer({
    super.key,
    required this.centerImage, // Make it required
    required this.sideImage, // Make it required
  });

  @override
  Widget build(BuildContext context) {
    final color = const Color.fromARGB(120, 89, 94, 146);

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: color, // Color with RGB and 10% opacity
            ),
            child: Image.asset(centerImage), // Load center image
          ),
        ),
        const SizedBox(height: 10), // Add space between images
      ],
    );
  }
}
