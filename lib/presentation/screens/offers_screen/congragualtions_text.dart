

import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/services.dart';














class conragualtionText extends StatelessWidget {
  const conragualtionText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Congratulations! ',
            style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: 'We can offer you ',
            style: TextStyle(color: Colors.black),
          ),
          TextSpan(
            text: 'Rs. 10,000 ',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: 'Amount Within ',
            style: TextStyle(color: Colors.black),
          ),
          TextSpan(
            text: '30 minutes ',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: 'for 90 days, with a payable amount of ',
            style: TextStyle(color: Colors.black),
          ),
          TextSpan(
            text: 'Rs. 10,600.',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: ' Just with a few more steps.',
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
