
import 'package:creditsea/utility/constants/constants.dart';
import 'package:flutter/material.dart';

class Iconcontainer extends StatelessWidget {
  final Color color;

  const Iconcontainer({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: color, // Color with RGB and 10% opacity
              ),
              child: Image.asset('assets/images/bike.png'),
            ),
            w20,
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: color, // Color with RGB and 10% opacity
              ),
              child: Image.asset('assets/images/bike.png'),
            ),
          ],
        ),
        h20,
        Row(
          children: [
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: color),
                child: Image.asset('assets/images/laptop.png')),
            w20,
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: color),
                child: Image.asset('assets/images/phone.png')),
          ],
        ),
      ],
    );
  }
}
