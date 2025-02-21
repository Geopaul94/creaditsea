import 'package:creditsea/presentation/widgets/responsive_helper.dart';
import 'package:flutter/material.dart';

class MyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = ResponsiveHelper.getScreenWidth(context);
    double screenHeight = ResponsiveHelper.getScreenHeight(context);
    Orientation orientation = ResponsiveHelper.getScreenOrientation(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('My Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Screen Width: $screenWidth'),
            Text('Screen Height: $screenHeight'),
            Text('Orientation: $orientation'),
            // Use screenWidth and screenHeight to build your layout
          ],
        ),
      ),
    );
  }
}
