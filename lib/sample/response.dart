import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget Function(BuildContext, Size) builder;

  const Responsive({Key? key, required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return builder(context, MediaQuery.of(context).size);
      },
    );
  }
}
